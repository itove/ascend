#!/bin/bash
#
# vim:ft=bash

set -e

# git clone -b v0.3.9 --depth 1 https://github.com/kvcache-ai/Mooncake.git

cd /vllm-workspace/Mooncake

sed -i 's|https://go.dev/dl/|https://golang.google.cn/dl/|g' dependencies.sh

apt-get install mpich libmpich-dev -y

bash dependencies.sh -y

mkdir build
cd build
cmake .. -DUSE_ASCEND_DIRECT=ON
make -j
make install

# export LD_LIBRARY_PATH=/usr/local/lib64/python3.12/site-packages/mooncake:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/Ascend/cann-9.0.0/python/site-packages/mooncake:$LD_LIBRARY_PATH
