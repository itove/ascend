#!/bin/bash
#
# vim:ft=bash

# https://www.hiascend.com/document/detail/zh/mindie/21RC2/mindieservice/servicedev/mindie_service0161.html

. /s/ENVs
export MINDIE_LOG_TO_STDOUT="benchmark:1; client:1"
export MINDIE_LOG_LEVEL=INFO
export LCCL_DETERMINISTIC=1
export HCCL_DETERMINISTIC=true
export ATB_MATMUL_SHUFFLE_K_ENABLE=0

DATASET_PATH=/s/test/dataset_gxm8k.jsonl

chmod 640 /usr/local/lib/python3.11/site-packages/mindiebenchmark/config/config.json
chmod 640 /usr/local/lib/python3.11/site-packages/mindieclient/python/config/config.json
chown root:root $DATASET_PATH

echo Starting accuracy benchmark...

benchmark \
--DatasetPath "$DATASET_PATH" \
#--DatasetType mmlu \
--DatasetType gsm8k \
--ModelName "deepseek-v3" \
--ModelPath "$MODEL_PATH" \
--TestType client \
--Http "http://${addr[gx1]}:1025" \
--ManagementHttp "http://127.0.0.2:1026" \
--Concurrency 1 \
--MaxOutputLen 20 \
--TaskKind stream \
--Tokenizer True \
--TestAccuracy True
