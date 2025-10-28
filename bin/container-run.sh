#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

#. set_env.sh

export ASCEND_HOME=/usr/local/Ascend

source $ASCEND_HOME/ascend-toolkit/set_env.sh
source $ASCEND_HOME/nnal/atb/set_env.sh
source $ASCEND_HOME/atb-models/set_env.sh
source $ASCEND_HOME/mindie/set_env.sh

export MIES_INSTALL_PATH=$ASCEND_HOME/mindie/latest/mindie-service
export LD_LIBRARY_PATH=${MIES_INSTALL_PATH}/lib:${MIES_INSTALL_PATH}/lib/grpc:${LD_LIBRARY_PATH}
export PYTHONPATH=${MIES_INSTALL_PATH}/bin:${PYTHONPATH}
export ATB_OPERATION_EXECUTE_ASYNC=1
export TASK_QUEUE_ENABLE=1
export HCCL_BUFFSIZE=120
# mindie-service日志
export MINDIE_LOG_TO_STDOUT=1
export MINDIE_LOG_TO_FILE=1
export MINDIE_LOG_LEVEL="error"
# 运行时日志
export ASCEND_SLOG_PRINT_TO_STDOUT=0
export ASCEND_GLOBAL_LOG_LEVEL=3
export ASCEND_GLOBAL_EVENT_ENABLE=1
# 加速库日志
export ATB_LOG_TO_FILE=1
export ATB_LOG_TO_FILE_FLUSH=0
export ATB_LOG_TO_STDOUT=1
export ATB_LOG_LEVEL=ERROR
# 模型库日志
export ASDOPS_LOG_TO_FILE=1
export ASDOPS_LOG_TO_STDOUT=1
export ASDOPS_LOG_LEVEL=ERROR
# OCK后处理日志
export OCK_LOG_LEVEL=ERROR
export OCK_LOG_TO_STDOUT=1

export MIES_CONTAINER_IP=172.20.84.67
#export MIES_CONTAINER_IP=172.20.84.77
#export MIES_CONTAINER_IP=172.20.84.189
#export MIES_CONTAINER_IP=172.20.84.50
# MindIE 2.1
export RANK_TABLE_FILE=/data/rank_table.json
# MindIE 2.0
export RANKTABLEFILE=/data/rank_table.json
export HCCL_DETERMINISTIC=true

export ATB_LLM_HCCL_ENABLE=1
export ATB_LLM_COMM_BACKEND="hccl"
export HCCL_CONNECT_TIMEOUT=7200 # 该环境变量需要配置为整数，取值范围[120,7200]，单位s
# 双机：
#export WORLD_SIZE=16
# 四机：
export WORLD_SIZE=32
export HCCL_EXEC_TIMEOUT=0

# 解决权重加载过慢问题
export OMP_NUM_THREADS=1
# 设置显存比
export NPU_MEMORY_FRACTION=0.95

#cp /root/config.json $MIES_INSTALL_PATH/conf/

cd $MIES_INSTALL_PATH
bin/mindieservice_daemon 2>&1 | tee logs/output.log
