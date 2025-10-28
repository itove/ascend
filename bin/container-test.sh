#!/bin/bash

master_address=172.20.84.67
rank_id_start=0

cd /usr/local/Ascend/atb-models/tests/modeltest/

bash run.sh pa_bf16 full_CEval 5 1 deepseekv2 /data2/hf/models/deepseek-v3-bf16/ /data/rank_table.json 32 4 $rank_id_start $master_address
