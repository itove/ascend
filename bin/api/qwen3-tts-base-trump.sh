#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com/api}

# ENDPOINT=https://ai.zxaicc.com/api
# ENDPOINT=http://ai:3000/api
ENDPOINT=http://127.0.0.1:8004

curl $ENDPOINT/v1/audio/speech \
    --header "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
   -d '{
        "model": "qwen3-tts-12hz-1.7b-base",
        "input": "Mao Zedong[a] (26 December 1893 – 9 September 1976) was a Chinese communist revolutionary, political theorist and the founder of the Peoples Republic of China (PRC). He led China from the PRCs establishment in October 1949 until his death in September 1976, primarily through his role as the Chairman of the Chinese Communist Party (CCP).[b] His theories, which he advocated as a Chinese adaptation of Marxism–Leninism, are known as Mao Zedong Thought.",
        "language": "Chinese",
        "task_base": "base",
        "ref_audio": "http://172.20.29.137:8008/samples/trump.wav",
        "ref_text": "My fellow Americans: Tonight, I want to speak with you about our nations unprecedented response to the coronavirus outbreak that started in China and is now spreading throughout the world.  Today, the World Health Organization officially announced that this is a global pandemic.  We have been in frequent contact with our allies, and we are marshalling the full power of the federal government and the private sector to protect the American"
    }' --output output.wav



