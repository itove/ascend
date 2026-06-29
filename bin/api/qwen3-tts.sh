#!/bin/bash
#
# vim:ft=bash

. .env.local

# ENDPORINT=https://ai.zxaicc.com/api
# ENDPORINT=http://ai:3000/api
ENDPORINT=http://gx107:8004

curl $ENDPORINT/v1/audio/speech \
    --header "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
   -d '{
        "input": "Hello, how are you?",
        "task_type": "Base",
        "language": "English"
    }' --output output.wav
