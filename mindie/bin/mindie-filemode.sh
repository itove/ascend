#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

# {MindIE安装目录}/latest
# 若文件权限不符合要求将会导致MindIE Server启动失败
# see https://www.hiascend.com/document/detail/zh/mindie/21RC2/envdeployment/instg/mindie_instg_0026.html
cd $MIES_INSTALL_PATH/../../latest

chmod 750 mindie-service
chmod -R 550 mindie-service/bin
chmod -R 500 mindie-service/bin/mindie_llm_backend_connector
chmod 550 mindie-service/lib
chmod 440 mindie-service/lib/*
chmod 550 mindie-service/lib/grpc
chmod 440 mindie-service/lib/grpc/*
chmod -R 550 mindie-service/include
chmod -R 550 mindie-service/scripts
chmod 750 mindie-service/logs
chmod 750 mindie-service/conf
chmod 640 mindie-service/conf/config.json
chmod 700 mindie-service/security
chmod -R 700 mindie-service/security/*
