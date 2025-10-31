#!/bin/bash
#
# vim:ft=bash

tag=2.1.RC2-800I-A2-py311-openeuler24.03-lts
name=mindie
#name=mindie2.1
#tag=2.0.T3.1-800I-A2-py311-openeuler24.03-lts 
#name=mindie2.0
#tag=2.2.T30-800I-A2-py311-openeuler24.03-lts-arm64
#name=mindie2.2

echo Stopping previous one...
docker stop $name

echo Wait 2 sec...
sleep 2

echo Starting new...
docker run -itd --user root --privileged --rm --name=$name --net=host \
   --shm-size 500g \
   --device=/dev/davinci0 \
   --device=/dev/davinci1 \
   --device=/dev/davinci2 \
   --device=/dev/davinci3 \
   --device=/dev/davinci4 \
   --device=/dev/davinci5 \
   --device=/dev/davinci6 \
   --device=/dev/davinci7 \
   --device=/dev/davinci_manager \
   --device=/dev/hisi_hdc \
   --device /dev/devmm_svm \
   -v /usr/local/Ascend/driver:/usr/local/Ascend/driver \
   -v /usr/local/Ascend/firmware:/usr/local/Ascend/firmware \
   -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi \
   -v /usr/local/sbin:/usr/local/sbin \
   -v /etc/hccn.conf:/etc/hccn.conf \
   -v /mnt/d:/d \
   -v /mnt/gx3:/gx3 \
   swr.cn-south-1.myhuaweicloud.com/ascendhub/mindie:$tag \
   bash

echo Entering...
docker exec -it $name bash
