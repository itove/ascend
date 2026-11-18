#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

. .env.local

BASEURL=http://172.20.116.200:8011
ENDPOINT=https://ai.zxaicc.com/api
# URL=http://172.20.29.123

curl --request POST \
  --url $BASEURL/v1/images/generations \
  --header "Authorization: Bearer $API_KEY" \
  --header 'Content-Type: application/json' \
  --output minimax-h3-image-$(date +%Y%m%d%H%M%S).jpg \
  --data '
{
  "model": "minimax-h3-image",
  "prompt": "An orange cat lying on a windowsill basking in the sun, warm afternoon light, film texture",
  "size": "2720x1536",
  "n": 1,
  "response_format": "file"
}
'
echo
