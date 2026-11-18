```
# SHM_SIZE=2000 CONTAINER_NAME=minimix-h3-image DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.32.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
#!/bin/bash

set -e

. /s/ascend/vllm/ENVs

vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8011 \
    --trust-remote-code \
    --enforce-eager
```

```
{{#include minimax-h3-image.20261118025054.log }}
```
