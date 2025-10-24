#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

dir=gx
mkdir -p $dir/hf/cache $dir/hf/models/deepseek-v3 $dir/hf/models/deepseek-v3-0324
cd $dir/hf

#HF_ENDPOINT=https://hf-mirror.com hf download deepseek-ai/DeepSeek-V3 --cache-dir cache/ --local-dir models/deepseek-v3/
HF_ENDPOINT=https://hf-mirror.com hf download deepseek-ai/DeepSeek-V3-0324 --cache-dir cache/ --local-dir models/deepseek-v3-0324/
