#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############

. .env.local

URL=https://ai.zxaicc.com
# URL=http://172.20.29.123

#--header 'Authorization: Bearer API-KEY' \
# ip为主节点ip,port为主节点port
curl --location "$URL/api/v1/chats/list/user/f7b93d76-1c8b-4491-a7c3-7609295a549f" \
--header "Authorization: Bearer $API_KEY" \
--header 'Content-Type: application/json'

echo
