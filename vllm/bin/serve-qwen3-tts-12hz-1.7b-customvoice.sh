#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export ASCEND_RT_VISIBLE_DEVICES="4,5"

    #--deploy-config vllm_omni/deploy/qwen3_tts.yaml \
    # --allowed-local-media-path \
vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8012 \
    --trust-remote-code \
    --enforce-eager
