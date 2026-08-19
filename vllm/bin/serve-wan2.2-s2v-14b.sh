#!/bin/bash

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
# export ASCEND_RT_VISIBLE_DEVICES="6,7"
export VLLM_WORKER_MULTIPROC_METHOD=spawn

unset USE_MULTI_BLOCK_POOL
unset OMP_PROC_BIND
unset ACL_OP_INIT_MODE
unset TRITON_ALL_BLOCKS_PARALLEL

vllm serve $MODEL_PATH --omni \
	--served-model-name $MODEL_NAME
	--model-class-name WanS2VPipeline \
	--tensor-parallel-size 8 \
	--flow-shift 3.0 \
	--vae-use-slicing --vae-use-tiling \
	--cache-backend cache_dit \
	--port 8091
