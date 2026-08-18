#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export ASCEND_RT_VISIBLE_DEVICES="5"

    #--deploy-config vllm_omni/deploy/qwen3_tts.yaml \
vllm serve $MODEL_PATH \
    --allowed-local-media-path \
    --served-model-name $MODEL_NAME \
    --omni \
    --port 8004 \
    --trust-remote-code \
    --enforce-eager
