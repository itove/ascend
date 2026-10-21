#!/bin/bash
#
# vim:ft=bash


export VLLM_WORKER_MULTIPROC_METHOD=spawn
export ASCEND_RT_VISIBLE_DEVICES="4,5,6,7"
export VLLM_OMNI_VIDEO_SYNC_TIMEOUT=3600
export PYTHONDONTWRITEBYTECODE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export MINDIE_SD_FA_TYPE="ascend_laser_attention"
export HCCL_NPU_SOCKET_PORT_RANGE="auto"
export PYTHONPATH="/vllm-workspace/vllm-omni/MindIE-SD:$PYTHONPATH"

  # --cache-backend cache_dit \
vllm serve "$MODEL_PATH" \
  --served-model-name 'minimax-h3' \
  --omni \
  --host 0.0.0.0 \
  --port 8020 \
  --trust-remote-code \
  --num-gpus 4 \
  --usp 4 \
  --ring 1 \
  --text-encoder-tp-size 4 \
  --enable-distributed-layerwise-offload \
  --vae-parallel-mode tile \
  --vae-use-tiling \
  --vae-patch-parallel-size 4 \
  --enable-diffusion-pipeline-profiler \
  --diffusion-attention-config '{"default": {"backend": "RAINFUSION_ATTN", "block_sparse": {"sparsity": 0.8, "start_step": 12}}}' \
  --enable-cache-dit-summary \
  --cache-config '{"Fn_compute_blocks":2,"Bn_compute_blocks":1,"max_warmup_steps":4,"residual_diff_threshold":0.4,"max_continuous_cached_steps":4,"enable_taylorseer":true,"taylorseer_order":2}' \
  --dlo-no-use-allgather
