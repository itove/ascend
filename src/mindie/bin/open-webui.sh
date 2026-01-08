#!/bin/bash
#
# vim:ft=bash

# see https://docs.openwebui.com/getting-started/quick-start/

#docker pull ghcr.io/open-webui/open-webui:main

image=ghcr.io/open-webui/open-webui:main
name=open-webui
volume=open-webui
# volume=/home/al/w/open-webui/data

    # -e ENV=dev \
docker run \
    -e DEFAULT_LOCALE=zh-CN \
    -e ENABLE_OPENAI_API=True \
    -e OPENAI_API_BASE_URL="http://172.20.84.67:1025/v1" \
    -e CORS_ALLOW_ORIGIN="https://ai.zxaicc.com" \
    -e USER_AGENT="open-webui/0.3.6 (https://ai.zxaicc.com)" \
    -d -p 3000:8080 \
    --rm \
    -v $volume:/app/backend/data \
    --name $name \
    $image
