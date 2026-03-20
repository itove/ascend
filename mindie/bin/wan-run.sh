#!/bin/bash
#
# vim:ft=bash

model_base="/mnt/d/hf/Wan-AI/Wan2.2-T2V-A14B/"

export ALGO=1
export PYTORCH_NPU_ALLOC_CONF='expandable_segments:True'
export TASK_QUEUE_ENABLE=2
export CPU_AFFINITY_CONF=1
export TOKENIZERS_PARALLELISM=false
export FAST_LAYERNORM=1

torchrun --nproc_per_node=8 --master_port=23459 generate.py \
--task t2v-A14B \
--ckpt_dir ${model_base} \
--size 1280*720 \
--frame_num 81 \
--sample_steps 40 \
--dit_fsdp \
--t5_fsdp \
--cfg_size 2 \
--ulysses_size 4 \
--vae_parallel \
--prompt "Two anthropomorphic cats in comfy boxing gear and bright gloves fight intensely on a spotlighted stage." \
--base_seed 0
