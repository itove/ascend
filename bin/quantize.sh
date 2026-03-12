#!/bin/bash
#
# vim:ft=bash

# see https://gitee.com/ascend/msit/tree/master/msmodelslim/example/DeepSeek

python3 quant_deepseek_w8a8.py \
    --model_path /d/models/deepseek-R1-0528-bf16 \
    --save_path /d/models/deepseek-R1-0528-w8a8 \
    --batch_size 4 \
    --from_bf16 \
    --quant_mtp mix
