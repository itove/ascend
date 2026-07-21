#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com}
# ENDPOINT=http://ai:3000/api
# ENDPOINT=http://gx107:8003

curl $ENDPOINT/v1/chat/completions \
    --header "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "model": "qwen3-asr-1.7b",
    "messages": [
    {"role": "user", "content": [
        {"type": "audio_url",
        "audio_url":
        {"url": "https://xpx.hrisk.cn/output.wav"}}
    ]}
    ]
}'
