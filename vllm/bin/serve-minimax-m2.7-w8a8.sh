#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs
export OMP_PROC_BIND=false
export OMP_NUM_THREADS=1
export TASK_QUEUE_ENABLE=1
# export ASCEND_RT_VISIBLE_DEVICES="6,7"

unset USE_MULTI_BLOCK_POOL
unset OMP_PROC_BIND
unset ACL_OP_INIT_MODE
unset TRITON_ALL_BLOCKS_PARALLEL

# From https://docs.vllm.ai/projects/ascend/en/latest/tutorials/models/MiniMax-M2.html#51-single-node-online-deployment
sysctl -w vm.swappiness=0
sysctl -w kernel.numa_balancing=0
sysctl kernel.sched_migration_cost_ns=50000

export HCCL_BUFFSIZE=512
export HCCL_OP_EXPANSION_MODE="AIV"
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so.2:$LD_PRELOAD
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True

vllm serve $MODEL_PATH \
    --served-model-name $MODEL_NAME \
    --host 0.0.0.0 \
    --port 8001 \
    --trust-remote-code \
    --tensor-parallel-size 8 \
    --quantization ascend \
    --enable-expert-parallel \
    --max-num-seqs 32 \
    --seed 1024 \
    --enable-prefix-caching \
    --max-num-batched-tokens 32768 \
    --compilation-config '{"cudagraph_mode": "FULL_DECODE_ONLY"}' \
    --gpu-memory-utilization 0.9 \
    --enable-auto-tool-choice \
    --tool-call-parser "minimax_m2" \
    --reasoning-parser "minimax_m2_append_think" \
    --additional-config '{"enable_cpu_binding":true}' \
    --model-loader-extra-config '{"enable_multithread_load":true,"num_threads":16}' \
    --speculative_config '{"method": "eagle3", "model": "/s/modelscope/Eco-Tech/MiniMax-M2.7-eagle-model-short/",  "num_speculative_tokens":3}'
