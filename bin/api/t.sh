#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############


#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
# "max_tokens": 8192,
curl --location 'http://gx1:1025/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data '
{
    "model": "deepseek-v3",
    "messages": [{
        "role": "user",
        "content": "讲一个西部风格的故事"
    }],
    "stream": true,
    "presence_penalty": 1.03,
    "frequency_penalty": 1.0,
    "repetition_penalty": 1.0,
    "temperature": 0.5,
    "top_p": 0.95,
    "top_k": -1,
    "seed": null,
    "stop": ["stop1", "stop2"],
    "stop_token_ids": [2, 13],
    "include_stop_str_in_output": false,
    "skip_special_tokens": true,
    "ignore_eos": false,
    "best_of": 1,
    "n": 1,
    "logprobs": false,
    "top_logprobs":null
}
'

echo
