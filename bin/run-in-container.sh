#!/bin/bash
#
# vim:ft=bash
#
# example:
# run signle node for small model with **custom** config.json
# CONF_PATH=/gx3/conf/config-1.json MULTI=0 MODEL_PATH=/gx3/hf/deepseek-ai/DeepSeek-R1-Distill-Llama-8B /gx3/run-in-container.sh
#
# run multi nodes for large model with **default** config.json
# MODEL_PATH=/gx3/hf/deepseek-ai/DeepSeek-R1-Distill-Llama-8B /gx3/run-in-container.sh

set -e

. /s/ENVs

mkdir -p $MINDIE_LOG_PATH 
chmod 750 $MINDIE_LOG_PATH 

cd $MIES_INSTALL_PATH

echo Copy and edit config.json...
cp $CONF_PATH conf/config.json
sed -i "/ipAddress/s/IP_ADDR/${addr[$HOSTNAME]}/" conf/config.json
sed -i "/modelName/s:MODELNAME:$MODELNAME:" conf/config.json
sed -i "/modelWeightPath/s:MODEL_PATH:$MODEL_PATH:" conf/config.json
if [ $MULTI -ne 1 ]; then
    sed -i "/multiNodesInferEnabled/s/true/false/" conf/config.json
fi

echo Starting mindieservice_daemon... 
mkdir -p /s/log
bin/mindieservice_daemon 2>&1 | tee /s/log/mindie-$mindie_ver-$HOSTNAME-$(date +%Y%m%d%H%M%S).log
