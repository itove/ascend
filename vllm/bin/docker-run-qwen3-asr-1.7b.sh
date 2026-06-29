#!/bin/bash
#
# vim:ft=bash

name=vllm-ascend-qwen3-asr-1.7b

echo Stopping previous one...
docker stop $name

echo Wait 2 sec...
sleep 2

echo Starting new...

# Update --device according to your device (Atlas A2: /dev/davinci[0-7] Atlas A3:/dev/davinci[0-15]).
# Update the vllm-ascend image according to your environment.
# Note you should download the weight to /root/.cache in advance.
export IMAGE=quay.io/ascend/vllm-ascend:v0.21.0rc1

docker run --rm \
    --user root \
    --privileged \
    --name $name \
    --net=host \
    --shm-size=1g \
    --device /dev/davinci4 \
    --device /dev/davinci_manager \
    --device /dev/devmm_svm \
    --device /dev/hisi_hdc \
    -v /usr/local/dcmi:/usr/local/dcmi \
    -v /usr/local/bin/npu-smi:/usr/local/bin/npu-smi \
    -v /usr/local/Ascend/driver/lib64/:/usr/local/Ascend/driver/lib64/ \
    -v /usr/local/Ascend/driver/version.info:/usr/local/Ascend/driver/version.info \
    -v /etc/ascend_install.info:/etc/ascend_install.info \
    -v /mnt/d:/d \
    -v /mnt/s:/s \
    -p 8003:8003 \
    -it $IMAGE bash

echo Entering...
docker exec -it $name bash
