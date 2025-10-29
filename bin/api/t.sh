#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############


#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
curl --location 'http://172.20.84.67:1025/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data '
{
    "model": "deepseek-v3",
    "messages": [{
        "role": "user",
        "content": "你是谁"
    }]
}
'
echo

