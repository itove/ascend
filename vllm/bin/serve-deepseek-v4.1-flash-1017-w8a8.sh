#!/bin/bash
#
# vim:ft=bash

set -e

. /s/ascend/vllm/ENVs

export VLLM_USE_V2_MODEL_RUNNER=0
export VLLM_ENGINE_READY_TIMEOUT_S=36000
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True

export HCCL_BUFFSIZE=1024
export HCCL_OP_EXPANSION_MODE="AIV"

vllm serve "$MODEL_PATH" \
    --host 0.0.0.0 \
    --port 8900 \
    --max-model-len 150000 \
    --max-num-batched-tokens 8192 \
    --served-model-name "$MODEL_NAME" \
    --gpu-memory-utilization 0.9 \
    --max-num-seqs 32 \
    --data-parallel-size 1 \
    --tensor-parallel-size 8 \
    --enable-expert-parallel \
    --tokenizer-mode deepseek_v41 \
    --reasoning-parser deepseek_v41 \
    --tool-call-parser deepseek_v41 \
    --enable-auto-tool-choice \
    --safetensors-load-strategy lazy \
    --quantization ascend \
    --block-size 128 \
    --compilation-config '{"cudagraph_mode":"FULL_DECODE_ONLY"}' \
    --async-scheduling \
    --engram-config '{"cpu_offload":true,"dp_shared_memory":true}' \
    --additional-config '{
        "ascend_compilation_config":{
            "enable_npugraph_ex":true,
            "enable_static_kernel":false
        },
        "enable_cpu_binding":true,
        "enable_fused_mc2":1,
        "enable_dsa_cp":true,
        "enable_flashcomm1":true,
        "enable_shared_expert_dp":true
    }'
