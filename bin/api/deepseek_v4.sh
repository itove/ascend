#!/bin/bash
#
# vim:ft=bash

curl http://172.20.84.193:8006/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "deepseek_v4",
        "messages": [
            {
                "role": "user",
                "content": "Who are you?"
            }
        ],
        "max_tokens": 256,
        "temperature": 0
    }'
