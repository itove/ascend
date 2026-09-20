#!/bin/bash
#
# vim:ft=bash

nic_name="bond0.316"
local_ip=$(ifconfig "$nic_name" | awk '/inet /{print $2}')
head_node_ip="172.20.116.192"

export MODEL_PATH=/s/hf/MiniMaxAI/MiniMax-M2.7/

python /vllm-workspace/vllm-ascend/examples/external_online_dp/launch_online_dp.py --dp-size 1 --tp-size 8 --dp-size-local 1 --dp-rank-start 0 --dp-address $head_node_ip --dp-rpc-port 12321 --vllm-start-port 7100
