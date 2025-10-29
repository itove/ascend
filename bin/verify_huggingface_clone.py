#!/usr/bin/env python3
# SPDX-License-Identifier: apache-2.0
# this was vibecoded with kimi-k2
# note, this is for hf cli users, git lfs clones have git-lfs fsck afaict
# see https://github.com/huggingface/huggingface_hub/issues/3298
"""
verify_hashes.py  [DIRECTORY]

Verify every file in DIRECTORY against its SHA256 or git hash on Hugging Face Hub.
At exit, prints a single line indicating whether all files matched or not.
"""

import argparse
import hashlib
import os
import subprocess
import sys
from multiprocessing import Pool, Manager

from huggingface_hub import get_hf_file_metadata

#REPO_ID = "Qwen/Qwen3-Coder-480B-A35B-Instruct"
REPO_ID = "deepseek-ai/DeepSeek-V3" 
#REPO_ID = "deepseek-ai/DeepSeek-V3-0324" 
#REPO_ID = "NousResearch/Meta-Llama-3-8B" 

# Shared variables for inter-process communication
manager = Manager()
mismatch_counter = manager.Value('i', 0)   # counts mismatches
print_lock = manager.Lock()                # synchronized printing


def sha256_hash(filepath):
    sha256 = hashlib.sha256()
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            sha256.update(chunk)
    return sha256.hexdigest()


def git_hash_object(filepath):
    try:
        result = subprocess.run(
            ["git", "hash-object", filepath],
            capture_output=True,
            text=True,
            check=True,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        with print_lock:
            print(f"[git hash-object error] {filepath}: {e}", file=sys.stderr)
        return None


def verify_file(file_path):
    global mismatch_counter

    file_name = os.path.basename(file_path)
    with print_lock:
        print(f"Starting {file_name}")

    try:
        metadata = get_hf_file_metadata(
            url=f"https://huggingface.co/{REPO_ID}/resolve/main/{file_name}?download=true"
        )
        expected_sha256 = metadata.etag  # etag is SHA256 for regular files
        local_sha256 = sha256_hash(file_path)
        git_hash = git_hash_object(file_path)
        has_match = False

        with print_lock:
            if local_sha256 == expected_sha256:
                print(f"{file_name}: SHA256 OK")
                has_match = True
            else:
                print(f"{file_name}: SHA256 MISMATCH!")
                print(f"  Local:    {local_sha256}")
                print(f"  Expected: {expected_sha256}")

            if git_hash:
                print(f"{file_name}: git hash-object = {git_hash}")
                if git_hash == expected_sha256:
                    print(f"{file_name}: git hash-object matches SHA256")
                    has_match = True
                else:
                    print(f"{file_name}: git hash-object does NOT match SHA256")

            if not has_match:
                mismatch_counter.value += 1

    except Exception as e:
        with print_lock:
            print(f"[metadata error] {file_name}: {e}", file=sys.stderr)
            mismatch_counter.value += 1


def main():
    parser = argparse.ArgumentParser(description="Verify local files against Hugging Face Hub.")
    parser.add_argument("directory", nargs="?", default=".", help="Directory to scan (default: current dir)")
    args = parser.parse_args()

    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a directory", file=sys.stderr)
        sys.exit(1)

    # Collect regular, non-hidden files
    files = [
        os.path.join(args.directory, f)
        for f in os.listdir(args.directory)
        if os.path.isfile(os.path.join(args.directory, f)) and not f.startswith(".")
    ]

    if not files:
        print("No files to check.")
        return

    with Pool() as pool:
        pool.map(verify_file, files)

    # Final summary
    if mismatch_counter.value == 0:
        print("\nAll files matched.")
    else:
        print(f"\n{int(mismatch_counter.value)} file(s) had mismatches.")


if __name__ == "__main__":
    main()
