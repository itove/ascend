#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############
python /vllm-workspace/vllm-ascend/examples/external_online_dp/launch_online_dp.py --dp-size 8 --tp-size 2 --dp-size-local 4 --dp-rank-start 0 --dp-address 172.20.84.54 --dp-rpc-port 12321 --vllm-start-port 7100
