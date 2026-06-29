#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

vllm serve $MODEL_PATH \
  --tensor-parallel-size 1 \
  --max-model-len 4096 \
  --gpu-memory-utilization 0.9 \
  --enforce-eager \
  --port 8003
