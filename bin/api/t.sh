#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com}

# For Qwen3.6
# extra_body.chat_template_kwargs.enable_thinking = false
# see https://huggingface.co/Qwen/Qwen3.6-27B#instruct-or-non-thinking-mode

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
    "stream": true,
    "extra_body": {
        "chat_template_kwargs": {
            "enable_thinking": false
        }
    }
}
'

echo
