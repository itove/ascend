#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export ASCEND_RT_VISIBLE_DEVICES="5"

vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --deploy-config vllm_omni/deploy/qwen3_tts.yaml \
    --omni \
    --port 8004 \
    --trust-remote-code \
    --enforce-eager
