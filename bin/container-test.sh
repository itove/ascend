#!/bin/bash

# 解决权重加载过慢问题
export OMP_NUM_THREADS=1
# 设置显存比
export NPU_MEMORY_FRACTION=0.95

master_address=172.20.84.67
rank_id_start=0

cd /usr/local/Ascend/atb-models/tests/modeltest/

./run.sh pa_bf16 full_CEval 5 1 deepseekv2 /data2/hf/models/deepseek-v3-bf16/ /data/rank_table.json 32 4 $rank_id_start $master_address 2>&1 | tee $MIES_INSTALL_PATH/logs/test.log

# bash run.sh pa_bf16 full_GSM8K 8 deepseekv2 /data2/hf/models/deepseek-v3-bf16/ /data/rank_table.json 32 4 $rank_id_start $master_address

# bash run.sh pa_bf16 performance [[256,256]] 1 deepseekv2 /data2/hf/models/deepseek-v3-bf16 /data/rank_table.json 32 4 $rank_id_start $master_address
