#!/bin/bash
#
# vim:ft=bash

# see https://docs.openwebui.com/getting-started/quick-start/

docker pull ghcr.io/open-webui/open-webui:main

image=ghcr.io/open-webui/open-webui:main
name=open-webui
volume=open-webui

docker run -e DEFAULT_LOCALE=zh-CN -d -p 3000:8080 -v $volume:/app/backend/data --name $name $image
