#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com/api}

# ENDPOINT=https://ai.zxaicc.com/api
# ENDPOINT=http://ai:3000/api
ENDPOINT=http://172.20.116.82:8011

        # "stream": true,
curl $ENDPOINT/v1/audio/speech \
    --header "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
   -d '{
        "model": "qwen3-tts-12hz-1.7b-base",
        "input": "《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统。新版通行本前八十回据脂本汇校，后四十回据程本汇校，署名“曹雪芹著，无名氏续，程伟元、高鹗整理”。",
        "voice": "wang_xu_pei"
    }' --output output.wav



