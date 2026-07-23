#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

nic_name="bond0.284"
local_ip="172.20.84.145"

export HCCL_IF_IP=$local_ip
export GLOO_SOCKET_IFNAME=$nic_name
export TP_SOCKET_IFNAME=$nic_name
export HCCL_SOCKET_IFNAME=$nic_name

# To reduce memory fragmentation and avoid out of memory
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export HCCL_OP_EXPANSION_MODE="AIV"
export HCCL_BUFFSIZE=1024
export OMP_NUM_THREADS=1
export TASK_QUEUE_ENABLE=1
# echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sysctl -w vm.swappiness=0
sysctl -w kernel.numa_balancing=0
sysctl kernel.sched_migration_cost_ns=50000
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so.2:$LD_PRELOAD
# export VLLM_ASCEND_ENABLE_FLASHCOMM1=1
export ASCEND_RT_VISIBLE_DEVICES=$1

export LD_LIBRARY_PATH=/usr/local/Ascend/ascend-toolkit/latest/python/site-packages/mooncake:$LD_LIBRARY_PATH

unset USE_MULTI_BLOCK_POOL
unset OMP_PROC_BIND
unset ACL_OP_INIT_MODE
unset TRITON_ALL_BLOCKS_PARALLEL

    # --quantization ascend \
vllm serve $MODEL_PATH \
    --host 0.0.0.0 \
    --port $2 \
    --data-parallel-size $3 \
    --data-parallel-rank $4 \
    --data-parallel-address $5 \
    --data-parallel-rpc-port $6 \
    --tensor-parallel-size $7 \
    --enable-expert-parallel \
    --seed 1024 \
    --served-model-name $MODEL_NAME \
    --max-num-seqs 128 \
    --max-model-len 262144 \
    --max-num-batched-tokens 16384 \
    --trust-remote-code \
    --gpu-memory-utilization 0.90 \
    --enable-prefix-caching \
    --speculative_config '{"method": "mtp", "num_speculative_tokens": 3, "enforce_eager": true}' \
    --additional-config '{"enable_cpu_binding":true, "ascend_scheduler_config": {"enabled": true}, "enable_prefill_optimizations": true, "multistream_overlap_shared_expert": true, "enable_flashcomm1": true}' \
    --tool-call-parser "qwen3_coder" \
    --enable-auto-tool-choice \
    --async-scheduling \
  --kv-transfer-config \
  '{"kv_connector": "MooncakeConnectorV1",
  "kv_role": "kv_producer",
  "kv_port": "30000",
  "engine_id": "0",
  "kv_connector_extra_config": {
            "prefill": {
                    "dp_size": 16,
                    "tp_size": 2
            },
            "decode": {
                    "dp_size": 8,
                    "tp_size": 2
        }
    }
  }'
