#!/bin/bash
#
# vim:ft=bash

[ -f .env.local ] && . .env.local

ENDPOINT=${ENDPOINT:-https://ai.zxaicc.com/api}

# ENDPOINT=https://ai.zxaicc.com/api
# ENDPOINT=http://ai:3000/api
ENDPOINT=http://172.20.116.82:8011
sample=/mnt/ns/public/samples/trump.wav
name=trump

curl -X 'POST' \
  "$ENDPOINT/v1/audio/voices" \
  -H "Authorization: Bearer $API_KEY" \
  -H 'accept: */*' \
  -H 'Content-Type: multipart/form-data' \
  -F "audio_sample=@$sample;type=audio/mpeg" \
  -F 'speaker_embedding=' \
  -F "consent=$name" \
  -F "name=$name" \
  -F 'ref_text=My fellow Americans: Tonight, I want to speak with you about our nations unprecedented response to the coronavirus outbreak that started in China and is now spreading throughout the world.  Today, the World Health Organization officially announced that this is a global pandemic.  We have been in frequent contact with our allies, and we are marshalling the full power of the federal government and the private sector to protect the American' \
  -F 'speaker_description='
