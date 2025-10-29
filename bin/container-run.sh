#!/bin/bash
#
# vim:ft=bash
#
# example:
# run signle node for small model with **custom** config.json
# CONF_PATH=/config.json MULTI=0 MODEL_NAME=DeepSeek-R1-Distill-Llama-8B /data/container-run.sh
#
# run multi nodes for large model with **default** config.json
# MODEL_NAME=DeepSeek-V3 /data/container-run.sh

set -e

CONF_PATH=${CONF_PATH:-/data/config.json}
MULTI=${MULTI:-1}
MODEL_NAME=${MODEL_NAME:-DeepSeek-V3}
echo CONF_PATH is $CONF_PATH
echo MULTI: $MULTI

#hostname=$(< /etc/hostname)
declare -A addr
addr[gx1]=172.20.84.67
addr[gx2]=172.20.84.77
addr[gx3]=172.20.84.189
addr[gx4]=172.20.84.50

echo hostname is: $HOSTNAME
echo IP is: ${addr[$HOSTNAME]}

mindie_ver=$(readlink /usr/local/Ascend/mindie/latest)
echo MindIE version: $mindie_ver

echo export ENVs
# ENVs
# see https://www.hiascend.com/document/detail/zh/mindie/21RC2/mindieservice/servicedev/mindie_service0300.html
export ASCEND_DIR=/usr/local/Ascend

source $ASCEND_DIR/ascend-toolkit/set_env.sh
source $ASCEND_DIR/nnal/atb/set_env.sh
source $ASCEND_DIR/atb-models/set_env.sh
source $ASCEND_DIR/mindie/set_env.sh

export MIES_INSTALL_PATH=$ASCEND_DIR/mindie/latest/mindie-service
export LD_LIBRARY_PATH=${MIES_INSTALL_PATH}/lib:${MIES_INSTALL_PATH}/lib/grpc:${LD_LIBRARY_PATH}
export PYTHONPATH=${MIES_INSTALL_PATH}/bin:${PYTHONPATH}
export ATB_OPERATION_EXECUTE_ASYNC=1
export TASK_QUEUE_ENABLE=1
export HCCL_BUFFSIZE=120
# mindie-service日志
export MINDIE_LOG_TO_STDOUT=1
export MINDIE_LOG_TO_FILE=1
export MINDIE_LOG_LEVEL=ERROR
export MINDIE_LOG_PATH=/data/log
# 运行时日志
export ASCEND_SLOG_PRINT_TO_STDOUT=0
export ASCEND_GLOBAL_LOG_LEVEL=3
export ASCEND_GLOBAL_EVENT_ENABLE=1
# 模型库日志
export ASDOPS_LOG_TO_FILE=1
export ASDOPS_LOG_TO_STDOUT=1
export ASDOPS_LOG_LEVEL=ERROR

if [ ${mindie_ver%.*} = 2.0 ]; then 
    echo export ENVs for MindIE version $mindie_ver
    # 加速库日志
    export ATB_LOG_TO_FILE=1 # deprecated, use MINDIE_LOG_TO_FILE 
    export ATB_LOG_TO_FILE_FLUSH=0
    export ATB_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    export ATB_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    # OCK后处理日志
    export OCK_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    export OCK_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    export MINDIE_LLM_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    export MINDIE_LLM_PYTHON_LOG_TO_STDOUT=ERROR # deprecated, use MINDIE_LOG_TO_STDOUT
    export MINDIE_LLM_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    export MINDIE_LLM_PYTHON_LOG_PATH # deprecated, use MINDIE_LOG_PATH 
    export MINDIE_LLM_PYTHON_LOG_LEVEL # deprecated, use MINDIE_LOG_LEVEL 
    export MINDIE_LLM_PYTHON_LOG_TO_FILE # deprecated, use MINDIE_LOG_TO_FILE 
    export MINDIE_LLM_LOG_TO_FILE # deprecated, use MINDIE_LOG_TO_FILE 
    export RANKTABLEFILE=/data/rank_table.json
else
    unset ATB_LOG_TO_FILE=1 # deprecated, use MINDIE_LOG_TO_FILE 
    unset ATB_LOG_TO_FILE_FLUSH=0
    unset ATB_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    unset ATB_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    unset OCK_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    unset OCK_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    unset MINDIE_LLM_LOG_LEVEL=ERROR # deprecated, use MINDIE_LOG_LEVEL 
    unset MINDIE_LLM_PYTHON_LOG_TO_STDOUT=ERROR # deprecated, use MINDIE_LOG_TO_STDOUT
    unset MINDIE_LLM_LOG_TO_STDOUT=1 # deprecated, use MINDIE_LOG_TO_STDOUT 
    unset MINDIE_LLM_PYTHON_LOG_PATH # deprecated, use MINDIE_LOG_PATH 
    unset MINDIE_LLM_PYTHON_LOG_LEVEL # deprecated, use MINDIE_LOG_LEVEL 
    unset MINDIE_LLM_PYTHON_LOG_TO_FILE # deprecated, use MINDIE_LOG_TO_FILE 
    unset MINDIE_LLM_LOG_TO_FILE # deprecated, use MINDIE_LOG_TO_FILE 
    unset RANKTABLEFILE=/data/rank_table.json
fi

export MIES_CONTAINER_IP=${addr[$HOSTNAME]}

export RANK_TABLE_FILE=/data/rank_table.json

if [ $MULTI -eq 1 ]; then
    export HCCL_DETERMINISTIC=true
    export ATB_LLM_HCCL_ENABLE=1
    export ATB_LLM_COMM_BACKEND="hccl"
    export HCCL_CONNECT_TIMEOUT=7200 # 该环境变量需要配置为整数，取值范围[120,7200]，单位s
    # 双机：
    #export WORLD_SIZE=16
    # 四机：
    export WORLD_SIZE=32
    export HCCL_EXEC_TIMEOUT=0
fi

# 解决权重加载过慢问题
export OMP_NUM_THREADS=1
# 设置显存比
export NPU_MEMORY_FRACTION=0.96

mkdir -p $MINDIE_LOG_PATH 
chmod 750 $MINDIE_LOG_PATH 

cd $MIES_INSTALL_PATH

echo Copy and edit config.json...
cp $CONF_PATH conf/config.json
sed -i "/ipAddress/s/IP_ADDR/${addr[$HOSTNAME]}/" conf/config.json
sed -i "/modelWeightPath/s/MODEL_NAME/$MODEL_NAME/" conf/config.json
if [ $MULTI -ne 1 ]; then
    sed -i "/multiNodesInferEnabled/s/true/false/" conf/config.json
fi

echo Starting mindieservice_daemon... 
mkdir -p /data/log
bin/mindieservice_daemon 2>&1 | tee /data/log/mindie-$mindie_ver-$HOSTNAME-$(date +%Y%m%d%H%M%S).log
