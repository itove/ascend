#!/bin/bash
#
# vim:ft=bash

# . /s/ascend/vllm/ENVs

export VLLM_USE_MODELSCOPE=true

host=${1:-127.0.0.1}
port=${2:-8006}
model_name=${3,,}

# see https://docs.vllm.ai/en/latest/cli/bench/serve/
# --ignore-eos
vllm bench serve \
    --served-model-name $model_name \
    --host $host \
    --port $port \
    --backend openai-chat \
    --endpoint /v1/chat/completions \
    --dataset-name random \
    --num-prompts 1000 \
    --request-rate 5 \
    --max-concurrency 32 \
    --random-input-len 16000 \
    --random-output-len 2048 \
    --num-warmups 10 \
    --save-result \
    --result-dir ./
