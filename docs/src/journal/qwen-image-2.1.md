### Links
[Qwen-Image-2.1 在 vLLM-Omni v0.28.0 部署指导文档](https://ai.atomgit.com/Ascend-SACT/Qwen-Image-2.1)

### Steps
```
SHM_SIZE=256 CONTAINER_NAME=qwen-image-2.1 DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.28.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
cd ..
cp -a /s/git/github/huggingface/diffusers/ .
chown -R root:root diffusers
cd diffusers
git reset --hard e0118ad
pip install .
pip install -U transformers==5.17.0
cd ..
cp -a diffusers/ diffusers-main
cp -a diffusers/ diffusers-main.bak

cp -a /s/git/Ascend-SACT/Qwen-Image-2.1/ .

# python Qwen-Image-2.1/patches/patch_rope.py
# python Qwen-Image-2.1/patches/patch_rope3.py
```

### error when patching
```
root@maas2:/vllm-workspace# python Qwen-Image-2.1/patches/patch_rope.py
[OK] patched /usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/transformer_qwenimage21.py
Traceback (most recent call last):
  File "/vllm-workspace/Qwen-Image-2.1/patches/patch_rope.py", line 21, in <module>
    src = open(f).read()
          ^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/vllm-workspace/diffusers-main.bak/src/diffusers/models/transformers/transformer_qwenimage21.py'
root@maas2:/vllm-workspace#
root@maas2:/vllm-workspace# python Qwen-Image-2.1/patches/patch_rope3.py
[MISS:rope] /usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/transformer_qwenimage21.py
root@maas2:/vllm-workspace# P=$(python3 -c "import diffusers,os;print(os.path.join(os.path.dirname(diffusers.__file__),'models/transformers/transformer_qwenimage21.py'))")

[W1016 08:00:11.843363078 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
root@maas2:/vllm-workspace# grep -c "npu patch" "$P"
4
```

### error when serving
```
cd vllm-omni/
vim serve.sh
chmod +x serve.sh
```

```
# serve.sh
unset ASCEND_VISIBLE_DEVICES
export ASCEND_RT_VISIBLE_DEVICES=0
export VLLM_PLATFORM=ascend
export VLLM_WORKER_MULTIPROC_METHOD=spawn

vllm serve /s/hf/Qwen/Qwen-Image-2.1/ \
  --omni \
  --port 8091 \
  --trust-remote-code \
  --diffusion-load-format diffusers \
  --diffusion-attention-backend TORCH_SDPA \
  --tensor-parallel-size 1 \
  --gpu-memory-utilization 0.9
```
