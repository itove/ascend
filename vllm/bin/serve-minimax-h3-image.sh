#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

    # --allowed-local-media-path \
vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8011 \
    --trust-remote-code \
    --enforce-eager \
    2>&1 | tee $MODEL_NAME.$(date +%Y%m%d%H%M%S).log
