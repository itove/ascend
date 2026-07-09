#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPORINT=${ENDPORINT:-https://ai.zxaicc.com}

curl --location "$ENDPORINT/v1/chat/completions" \
    --header "Authorization: Bearer $API_KEY" \
    --header 'Content-Type: application/json' \
    --data '
{
    "model": "qwen3.6-27b",
    "messages": [{
        "role": "user",
        "content": "hi"
    }],
    "stream": true
}
'

echo
