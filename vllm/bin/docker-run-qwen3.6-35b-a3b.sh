#!/bin/bash
#
# vim:ft=bash

CONTAINER_NAME=${CONTAINER_NAME:-vllm-ascend}
IMAGE_TAG=${IMAGE_TAG:-v0.18.0}

echo Stopping previous one...
docker stop $CONTAINER_NAME

echo Wait 2 sec...
sleep 2

echo Starting new...

# Update --device according to your device (Atlas A2: /dev/davinci[0-7] Atlas A3:/dev/davinci[0-15]).
# Update the vllm-ascend image according to your environment.
# Note you should download the weight to /root/.cache in advance.
export IMAGE=quay.io/ascend/vllm-ascend:$IMAGE_TAG

docker run --rm \
    --user root \
    --privileged \
    --name $CONTAINER_NAME \
    --net=host \
    --shm-size=1g \
    --device /dev/davinci0 \
    --device /dev/davinci1 \
    --device /dev/davinci2 \
    --device /dev/davinci3 \
    --device /dev/davinci4 \
    --device /dev/davinci5 \
    --device /dev/davinci6 \
    --device /dev/davinci7 \
    --device /dev/davinci_manager \
    --device /dev/devmm_svm \
    --device /dev/hisi_hdc \
    -v /usr/local/dcmi:/usr/local/dcmi \
    -v /usr/local/Ascend/driver/tools/hccn_tool:/usr/local/Ascend/driver/tools/hccn_tool \
    -v /usr/local/bin/npu-smi:/usr/local/bin/npu-smi \
    -v /usr/local/Ascend/driver/lib64/:/usr/local/Ascend/driver/lib64/ \
    -v /usr/local/Ascend/driver/version.info:/usr/local/Ascend/driver/version.info \
    -v /etc/ascend_install.info:/etc/ascend_install.info \
    -v /mnt/d:/d \
    -v /mnt/s:/s \
    -v /etc/hccn.conf:/etc/hccn.conf \
    -it $IMAGE bash

echo Entering...
docker exec -it $CONTAINER_NAME bash
