#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

if [ $NODES -gt 1 ]; then
    # this obtained through ifconfig
    # nic_name is the network interface name corresponding to local_ip of the current node
    nic_name="xxx"
    local_ip="xxx"

    # The value of node0_ip must be consistent with the value of local_ip set in node0 (master node)
    node0_ip="xxxx"

    vllm serve $MODEL_PATH \
        --host 0.0.0.0 \
        --port 8005 \
        --headless \
        --data-parallel-size 2 \
        --data-parallel-size-local 1 \
        --data-parallel-start-rank 1 \
        --data-parallel-address $node0_ip \
        --data-parallel-rpc-port 13389 \
        --tensor-parallel-size 8 \
        --quantization ascend \
        --seed 1024 \
        --served-model-name $MODEL_NAME \
        --enable-expert-parallel \
        --max-num-seqs 64 \
        --max-model-len 131072 \
        --max-num-batched-tokens 8192 \
        --trust-remote-code \
        --async-scheduling \
        --no-enable-prefix-caching \
        --chat-template $MODEL_PATH/chat_template.jinja \
        --gpu-memory-utilization 0.94 \
        --compilation-config '{"cudagraph_mode": "FULL_DECODE_ONLY"}' \
        --additional-config '{"enable_cpu_binding": "true", "multistream_overlap_shared_expert": true}' \
        --speculative-config '{"num_speculative_tokens": 3, "method": "deepseek_mtp"}'
else
    vllm serve $MODEL_PATH \
        --host 0.0.0.0 \
        --max_model_len 65536 \
        --max-num-batched-tokens 8192 \
        --served-model-name $MODEL_NAME \
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
fi
