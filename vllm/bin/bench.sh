#!/bin/bash
#
# vim:ft=bash

. /s/ascend/vllm/ENVs

export VLLM_USE_MODELSCOPE=true

host=${1:-127.0.0.1}
port=${2:-8006}

# see https://docs.vllm.ai/en/latest/cli/bench/serve/
vllm bench serve \
    --model $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --host $host \
    --port $port \
    --backend openai-chat \
    --endpoint /v1/chat/completions \
    --dataset-name random \
    --random-input 200 \
    --num-prompt 200 \
    --request-rate 1 \
    --save-result \
    --result-dir ./
