#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

. /gx3/ENVs
export MINDIE_LOG_TO_STDOUT="benchmark:1; client:1"
export MINDIE_LOG_LEVEL=INFO

DATASET_PATH=/gx3/test/dataset_gxm8k.jsonl
SMPL_PARAM='{"temperature":0.5,"top_k":10,"top_p":0.9,"seed":1234,"repetition_penalty":1}'  

chmod 640 /usr/local/lib/python3.11/site-packages/mindiebenchmark/config/config.json
chmod 640 /usr/local/lib/python3.11/site-packages/mindieclient/python/config/config.json
chown root:root $DATASET_PATH

echo Starting benchmark...

benchmark \
--DatasetPath "$DATASET_PATH" \
--DatasetType "gsm8k" \
--ModelName "deepseek-v3" \
--ModelPath "$MODEL_PATH" \
--TestType client \
--Http "http://${addr[gx1]}:1025" \
--ManagementHttp "http://127.0.0.2:1026" \
--Concurrency 128 \
--TaskKind stream \
--Tokenizer True \
--MaxOutputLen 512 \
--DoSampling True \
--SamplingParams $SMPL_PARAM
