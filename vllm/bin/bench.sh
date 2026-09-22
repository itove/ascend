#!/bin/bash
#
# vim:ft=bash

# . /s/ascend/vllm/ENVs

host=${1:-127.0.0.1}
port=${2:-8006}
model_path=${3:-/s/modelscope/Eco-Tech/DeepSeek-V4-Flash-w8a8-mtp}
model_name=$(basename $MODEL_PATH)
model_name=${model_name,,}
key="$4"

# see https://docs.vllm.ai/en/latest/cli/bench/serve/
# --ignore-eos
# --random-prefix-len 12000
# --header "Authorization=Bearer sk-xxx" \
vllm bench serve \
    --served-model-name $model_name \
    --model $model_path \
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
    --header "Authorization=Bearer $key" \
    --save-result \
    --result-dir /s/public/bench/
