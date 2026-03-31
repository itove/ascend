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

prompt="${1:-young woman 21 Years old with long curly  dark hair, vibrante Red lips is dancing  mówimy hips in a bright, old styl cowboy salon. She wears a  jeans, black top and cowboy boots, with minimal makeup. Her dance is sofisticacet  city street, and frequent eye contact with the camera. The camera is vertical 9:16, mostly medium shots with occasional close-ups, slightly panning and zooming to match the beat. The background has colorful neon lights or pastel walls, and the lighting pulses slightly to the music}"

echo Prompt: "$prompt"

torchrun generate.py \
    --nproc_per_node=8 \
    --ulysses_size 4 \
    --cfg_size 2 \
    --master_port=23459 \
    --task t2v-A14B \
    --ckpt_dir ${model_base} \
    --size 1280*720 \
    --frame_num 81 \
    --sample_steps 40 \
    --dit_fsdp \
    --t5_fsdp \
    --vae_parallel \
    --prompt "${prompt}" \
    --base_seed 0
