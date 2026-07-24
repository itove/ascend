#!/bin/bash
#
# vim:ft=bash

nic_name="bond0.284"
local_ip=$(ifconfig "$nic_name" | awk '/inet /{print $2}')
master_node_ip="172.20.84.145"

python /vllm-workspace/vllm-ascend/examples/external_online_dp/launch_online_dp.py --dp-size 16 --tp-size 2 --dp-size-local 4 --dp-rank-start 0 --dp-address $master_node_ip --dp-rpc-port 12321 --vllm-start-port 7100
