#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPORINT:-https://ai.zxaicc.com}

curl --location "$ENDPOINT/v1/chat/completions" \
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
