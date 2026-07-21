#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

. .env.local

ENDPOINT=${ENDPORINT:-https://ai.zxaicc.com}

#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
curl --location "$ENDPOINT/v1/models" \
    --header 'Content-Type: application/json' \
    --header "Authorization: Bearer $API_KEY" \

echo
