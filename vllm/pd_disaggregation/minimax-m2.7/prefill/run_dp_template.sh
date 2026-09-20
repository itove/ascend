#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sysctl -w vm.swappiness=0
sysctl -w kernel.numa_balancing=0
sysctl kernel.sched_migration_cost_ns=50000

nic_name="bond0.284"
local_ip=$(ifconfig "$nic_name" | awk '/inet /{print $2}')

export HCCL_BUFFSIZE=1024
export HCCL_IF_IP=$local_ip
export HCCL_OP_EXPANSION_MODE="AIV"
export HCCL_SOCKET_IFNAME=$nic_name
export ASCEND_RT_VISIBLE_DEVICES=$1

export LD_LIBRARY_PATH=/usr/local/Ascend/ascend-toolkit/latest/python/site-packages/mooncake:$LD_LIBRARY_PATH
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so.2:$LD_PRELOAD
export GLOO_SOCKET_IFNAME=$nic_name
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export PYTHONHASHSEED=0

    #--quantization ascend \
vllm serve $MODEL_PATH \
    --host 0.0.0.0 \
    --port $2 \
    --data-parallel-size $3 \
    --data-parallel-rank $4 \
    --data-parallel-address $5 \
    --data-parallel-rpc-port $6 \
    --tensor-parallel-size $7 \
    --enable-expert-parallel \
    --served-model-name $MODEL_NAME \
    --max-model-len 200000 \
    --max-num-batched-tokens 16384 \
    --max-num-seqs 64 \
    --trust-remote-code \
    --gpu-memory-utilization 0.75 \
    --enforce-eager \
    --speculative_config '{"method": "eagle3", "model": "/s/modelscope/Eco-Tech/MiniMax-M2.7-eagle-model-short/", "num_speculative_tokens": 1}' \
    --additional-config '{"enable_cpu_binding":true,
                        "enable_fused_mc2":1}' \
    --kv-transfer-config \
        '{"kv_connector": "MooncakeConnectorV1",
        "kv_role": "kv_producer",
        "kv_port": "35880",
        "engine_id": "0",
        "kv_connector_extra_config": {
             "use_ascend_direct": true,
             "prefill": {"dp_size": 1, "tp_size": 8},
             "decode":  {"dp_size": 1, "tp_size": 8}
        }}'
