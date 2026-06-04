#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs
# Load model from ModelScope to speed up download
export VLLM_USE_MODELSCOPE=True
# To reduce memory fragmentation and avoid out of memory
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export HCCL_BUFFSIZE=512
export OMP_PROC_BIND=false
export OMP_NUM_THREADS=1
export TASK_QUEUE_ENABLE=1
export ASCEND_RT_VISIBLE_DEVICES="6,7"

unset USE_MULTI_BLOCK_POOL
unset OMP_PROC_BIND
unset ACL_OP_INIT_MODE
unset TRITON_ALL_BLOCKS_PARALLEL

    # --quantization ascend \
vllm serve $MODEL_PATH \
    --host 0.0.0.0 \
    --port 8002 \
    --data-parallel-size 1 \
    --tensor-parallel-size 2 \
    --seed 1024 \
    --served-model-name $MODEL_NAME \
    --max-num-seqs 32 \
    --max-model-len 262144 \
    --max-num-batched-tokens 8096 \
    --trust-remote-code \
    --gpu-memory-utilization 0.90 \
    --enable-prefix-caching \
    --speculative_config '{"method": "qwen3_5_mtp", "num_speculative_tokens": 3, "enforce_eager": true}' \
    --compilation-config '{"cudagraph_mode":"FULL_DECODE_ONLY"}' \
    --additional-config '{"enable_cpu_binding":true}' \
    --async-scheduling
