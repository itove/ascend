#!/bin/bash
#
# vim:ft=bash

python /vllm-workspace/vllm-ascend/examples/disaggregated_prefill_v1/load_balance_proxy_server_example.py \
  --port 8000 \
  --host 172.20.84.145 \
  --prefiller-hosts \
    172.20.84.145 \
    172.20.84.149 \
    172.20.84.193 \
    172.20.84.240 \
  --prefiller-ports \
    7100 7101 7102 7103 7104 7105 7106 7107 7108 7109 7110 7111 7112 7113 7114 7115 \
  --decoder-hosts \
    172.20.84.54 \
    172.20.84.70 \
  --decoder-ports \
    7100 7101 7102 7103 7104 7105 7106 7107 \
