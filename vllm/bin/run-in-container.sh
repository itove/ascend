#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

vllm serve $MODEL_PATH \
  --host 0.0.0.0 \
  --max_model_len 65536 \
  --max-num-batched-tokens 8192 \
  --served-model-name ds \
  --gpu-memory-utilization 0.9 \
  --max-num-seqs 16 \
  --data-parallel-size 1 \
  --tensor-parallel-size 8 \
  --enable-expert-parallel \
  --quantization ascend \
  --port 8006 \
  --block-size 128 \
  --chat-template $MODEL_PATH/chat_template.jinja \
  --async-scheduling \
  --additional-config '{"enable_cpu_binding": "true", "multistream_overlap_shared_expert": true}' \
  --speculative-config '{"num_speculative_tokens": 1,"method": "deepseek_mtp"}' \
  --compilation-config '{"cudagraph_mode":"FULL_DECODE_ONLY"}'
