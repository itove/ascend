#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

# uv
#

# uv tool install huggingface_hub

modelname=${1:-deepseek-ai/DeepSeek-R1-0528}

hf_dir=/mnt/d/hf

while :
do
    echo Start downloading model: $modelname
    echo cache dir: $hf_dir/cache
    echo weights dir: $hf_dir/$modelname
    hf download $modelname --cache-dir $hf_dir/cache --local-dir $hf_dir/$modelname && break
done
