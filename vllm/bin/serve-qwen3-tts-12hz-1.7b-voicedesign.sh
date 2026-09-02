#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export ASCEND_RT_VISIBLE_DEVICES="6,7"

    #--deploy-config vllm_omni/deploy/qwen3_tts.yaml \
    # --allowed-local-media-path \
vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8013 \
    --trust-remote-code \
    --enforce-eager
