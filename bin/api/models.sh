#!/bin/bash
#
# vim:ft=bash

. .env.local

URL=https://ai.zxaicc.com
# URL=https://172.20.29.123
# URL=gx1:1025

#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
curl -k --location "$URL/api/v1/models" \
--header "Authorization: Bearer $API_KEY" \
--header 'Content-Type: application/json' 

echo
