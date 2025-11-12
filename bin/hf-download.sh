#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

# uv
#

# uv tool install huggingface_hub

modelname={$1:-deepseek-ai/DeepSeek-R1-0528}

while :
do
    hf download $modelname --cache-dir cache --local-dir models/$modelname && break
done
