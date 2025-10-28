#!/bin/bash
#
# vim:ft=bash

#tag=2.1.RC2-800I-A2-py311-openeuler24.03-lts
tag=2.0.T3.1-800I-A2-py311-openeuler24.03-lts 

docker run -itd --user root --privileged --rm --name=mindie --net=host \
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
   -v /mnt/data:/data \
   -v /mnt/data2:/data2 \
   swr.cn-south-1.myhuaweicloud.com/ascendhub/mindie:$tag \
   bash
