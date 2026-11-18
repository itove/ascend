# test-4 8 NPUs

```
# SHM_SIZE=2000 CONTAINER_NAME=minimix-h3-image DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=minimax-h3-image /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export PYTHONDONTWRITEBYTECODE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export HCCL_NPU_SOCKET_PORT_RANGE="auto"

    # --allowed-local-media-path \
vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8011 \
    --trust-remote-code \
    --enforce-eager \
    --num-gpus 8 \
    --diffusion-offload-config '{"mode":"layer","components":["dit","text_encoder"]}' \
    2>&1 | tee /s/public/logs/$MODEL_NAME.$(date +%Y%m%d%H%M%S).log
```

```
{{#include minimax-h3-image.20261118165948.log}}
```
