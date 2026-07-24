#!/bin/bash
#
# vim:ft=bash

. /s/ascend/vllm/ENVs

# nic_name is the network interface name corresponding to local_ip of the current node
nic_name="bond0.284"
local_ip=$(ifconfig "$nic_name" | awk '/inet /{print $2}')

export HCCL_IF_IP=$local_ip
export GLOO_SOCKET_IFNAME=$nic_name
export TP_SOCKET_IFNAME=$nic_name
export HCCL_SOCKET_IFNAME=$nic_name

# [Optional] jemalloc
# jemalloc is for better performance, if `libjemalloc.so` is installed on your machine, you can turn it on.
# export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so.2:$LD_PRELOAD

export HCCL_OP_EXPANSION_MODE="AIV"
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export OMP_PROC_BIND=false
export OMP_NUM_THREADS=1
export TASK_QUEUE_ENABLE=1
export LD_LIBRARY_PATH=/usr/local/Ascend/ascend-toolkit/latest/python/site-packages/mooncake:$LD_LIBRARY_PATH

export HCCL_BUFFSIZE=1024
# export VLLM_ASCEND_ENABLE_FLASHCOMM1=1
export ASCEND_RT_VISIBLE_DEVICES=$1

vllm serve $MODEL_PATH \
  --host 0.0.0.0 \
  --port $2 \
  --data-parallel-size $3 \
  --data-parallel-rank $4 \
  --data-parallel-address $5 \
  --data-parallel-rpc-port $6 \
  --tensor-parallel-size $7 \
  --seed 1024 \
  --quantization ascend \
  --served-model-name $MODEL_NAME \
  --trust-remote-code \
  --max-num-seqs 4 \
  --max-model-len 262144 \
  --max-num-batched-tokens 16384 \
  --no-enable-prefix-caching \
  --gpu-memory-utilization 0.95 \
  --enforce-eager \
  --speculative-config '{"method": "mtp", "num_speculative_tokens": 3, "enforce_eager": true}' \
  --additional-config '{"enable_cpu_binding":true, "enable_flashcomm1": true}' \
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
