#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com/api}

# ENDPOINT=https://ai.zxaicc.com/api
# ENDPOINT=http://ai:3000/api
ENDPOINT=http://172.20.116.82:8011

curl -X 'POST' \
  "$ENDPOINT/v1/audio/voices" \
  -H "Authorization: Bearer $API_KEY" \
  -H 'accept: */*' \
  -H 'Content-Type: multipart/form-data' \
  -F 'audio_sample=@wang_xu_pei.mp3;type=audio/mpeg' \
  -F 'speaker_embedding=' \
  -F 'consent=wang_xu_pei' \
  -F 'name=wang_xu_pei' \
  -F 'ref_text=欢迎大家莅临国星一号人工智能计算中心。大家好，我是竹溪县大数据公司的小王，接下来由我来为大家介绍国星一号的相关情况，不妥之处，请大家指正。' \
  -F 'speaker_description='
