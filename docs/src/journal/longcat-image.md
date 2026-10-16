```
SHM_SIZE=256 CONTAINER_NAME=longcat-image DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.30.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
vllm serve /s/hf/meituan-longcat/LongCat- --omni --port 8091
```
