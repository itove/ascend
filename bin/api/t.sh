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
        "content": "who are you?"
    }],
    "stream": false,
    "presence_penalty": 1.03,
    "frequency_penalty": 1.0,
    "repetition_penalty": 1.0,
    "temperature": 0.5,
    "top_p": 0.95,
    "seed": null,
    "stop": ["stop1", "stop2"],
    "stop_token_ids": [2, 13],
    "include_stop_str_in_output": false,
    "skip_special_tokens": true,
    "ignore_eos": false,
    "max_tokens": 20,
    "best_of": 1,
    "n": 1,
    "logprobs": false,
    "top_logprobs":null
}
'

