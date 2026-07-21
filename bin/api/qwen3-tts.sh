#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPORINT:-https://ai.zxaicc.com/api}

# ENDPOINT=https://ai.zxaicc.com/api
# ENDPOINT=http://ai:3000/api

curl $ENDPOINT/v1/audio/speech \
    --header "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
   -d '{
        "model": "qwen3-tts-12hz-1.7b-customvoice",
        "input": "本届艺术展聘请12位艺术家为总台书画院名誉副院长和特聘艺术家。获聘艺术家将担任总台节目嘉宾、参与文创设计、指导员工美育授课等，助力提升总台精品节目创作水准，推动总台文化建设与员工美育发展。其中，郭石夫、王镛、唐勇力、王明明受聘为总台书画院名誉副院长；中国国家画院研究员邢少臣，中央美术学院教授王晓辉，中国国家画院山水画所所长方向，中国国家画院研究员石峰，中国国家画院书法篆刻所副所长谢小铨，中国国家画院油画所所长赵培智，中国书法家协会理事徐右冰，中国书法家协会理事、故宫博物院副研究馆员程俊英受聘为总台书画院特聘艺术家。",
        "voice": "vivian",
        "language": "Chinese"
    }' --output output.wav
