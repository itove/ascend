#!/bin/bash
#
# vim:ft=bash

model_base="/s/hf/Wan-AI/Wan2.2-T2V-A14B/"

export ALGO=1
export PYTORCH_NPU_ALLOC_CONF='expandable_segments:True'
export TASK_QUEUE_ENABLE=2
export CPU_AFFINITY_CONF=1
export TOKENIZERS_PARALLELISM=false
export FAST_LAYERNORM=0

prompt="${1:-young woman 21 Years old with long curly  dark hair, vibrante Red lips is dancing  mówimy hips in a bright, old styl cowboy salon. She wears a  jeans, black top and cowboy boots, with minimal makeup. Her dance is sofisticacet  city street, and frequent eye contact with the camera. The camera is vertical 9:16, mostly medium shots with occasional close-ups, slightly panning and zooming to match the beat. The background has colorful neon lights or pastel walls, and the lighting pulses slightly to the music.}"

image="$2"

if [ -z "$image" ]; then
    echo Usage: $(basename $0) '<prompt>' '<image_path>'
    exit
fi

echo Prompt: "$prompt"

# Multi-GPU inference using FSDP + DeepSpeed Ulysses
torchrun --nproc_per_node=8 generate.py \
    --task i2v-A14B \
    --size 1280*720 \
    --ckpt_dir ${model_base} \
    --image examples/i2v_input.JPG \
    --dit_fsdp \
    --t5_fsdp \
    --cfg_size 1 \
    --ulysses_size 8 \
    --prompt "$prompt"

# Image-to-Video Generation without prompt
#DASH_API_KEY=your_key torchrun --nproc_per_node=8 generate.py \
#    --task i2v-A14B \
#    --size 1280*720 \
#    --ckpt_dir ${model_base} \
#    --prompt '' \
#    --image examples/i2v_input.JPG \
#    --dit_fsdp \
#    --t5_fsdp \
#    --cfg_size 1 \
#    --ulysses_size 8 \
#    --use_prompt_extend \
#    --prompt_extend_method 'dashscope'
