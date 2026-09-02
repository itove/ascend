#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export ASCEND_RT_VISIBLE_DEVICES="0,1"

vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --tensor-parallel-size 2 \
    --max-model-len 16384 \
    --gpu-memory-utilization 0.9 \
    --enforce-eager \
    --port 8010
