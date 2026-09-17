#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com}
# ENDPOINT=http://ai:3000/api
ENDPOINT=http://172.20.29.123:4000

curl $ENDPOINT/v1/audio/transcriptions \
    -H "Authorization: Bearer $API_KEY" \
    -F model=qwen3-asr-1.7b \
    -F file=@1.mp3
