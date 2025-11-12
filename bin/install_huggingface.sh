#!/bin/bash
#
# vim:ft=bash

hf_dir=/home/al/w/hf
py_ver=3.13

mkdir -p $hf_dir

cd $hf_dir

uv init -p $py_ver .
uv venv
# . .venv/bin/activate
uv add huggingface-hub pysocks socksio
