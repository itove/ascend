#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

. .env.local

#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
curl --location 'https://ai.itove.com/api/chat/completions' \
--header "Authorization: Bearer $API_KEY" \
--header 'Content-Type: application/json' \
--data '
{
    "model": "deepseek-v3",
    "messages": [{
        "role": "user",
        "content": "你是谁"
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
    "max_tokens": 2048,
    "best_of": 1,
    "n": 1,
    "logprobs": false,
    "top_logprobs":null
}
'

echo
