#!/bin/bash
#
# vim:ft=bash
#
# example:
# run signle node for small model with **custom** config.json
# CONF_PATH=/gx3/conf/config-1.json NODES=1 MODEL_PATH=/gx3/hf/deepseek-ai/DeepSeek-R1-Distill-Llama-8B /gx3/run-in-container.sh
#
# run multi nodes for large model with **default** config.json
# MODEL_PATH=/gx3/hf/deepseek-ai/DeepSeek-R1-Distill-Llama-8B /gx3/run-in-container.sh

set -e

. /s/ENVs

mkdir -p $MINDIE_LOG_PATH 
chmod 750 $MINDIE_LOG_PATH 
chown root:root $RANK_TABLE_FILE
chmod 640 $RANK_TABLE_FILE

cd $MIES_INSTALL_PATH

echo Copy and edit config.json...
cp $CONF_PATH conf/config.json
sed -i "/ipAddress/s/IP_ADDR/${addr[$HOSTNAME]}/" conf/config.json
sed -i "/modelName/s:MODELNAME:$MODELNAME:" conf/config.json
sed -i "/modelWeightPath/s:MODEL_PATH:$MODEL_PATH:" conf/config.json
if [ $NODES -gt 1 ]; then
    sed -i "/multiNodesInferEnabled/s/false/true/" conf/config.json
    sed -i "/DP_DP/s:DP_DP:$DP_DP:" conf/config.json
    sed -i "/DP_TP/s:DP_TP:$DP_TP:" conf/config.json
    sed -i "/DP_MOE_TP/s:DP_MOE_TP:$DP_MOE_TP:" conf/config.json
    sed -i "/DP_MOE_EP/s:DP_MOE_EP:$DP_MOE_EP:" conf/config.json
fi

echo Starting mindieservice_daemon... 
mkdir -p /s/log
bin/mindieservice_daemon 2>&1 | tee /s/log/mindie-$mindie_ver-$HOSTNAME-$(date +%Y%m%d%H%M%S).log
