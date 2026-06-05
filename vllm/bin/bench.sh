#!/bin/bash
#
# vim:ft=bash

. /s/ascend/vllm/ENVs

export VLLM_USE_MODELSCOPE=true

vllm bench serve \
    --model $MODEL_PATH \
    --port 8006
    --dataset-name random \
    --random-input 200 \
    --num-prompt 200 \
    --request-rate 1 \
    --save-result \
    --result-dir ./
