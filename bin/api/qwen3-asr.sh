#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPORINT=${ENDPORINT:-https://ai.zxaicc.com}
# ENDPORINT=http://ai:3000/api
# ENDPORINT=http://gx107:8003

curl $ENDPORINT/v1/chat/completions \
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
