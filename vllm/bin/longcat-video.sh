#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
torchrun --nproc_per_node=4 run_demo_text_to_video.py \
    --context_parallel_size=4 \
    --checkpoint_dir=/s/hf/meituan-longcat/LongCat-Video \
    --output_dir=/s/outputs/
