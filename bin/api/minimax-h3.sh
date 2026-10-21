#!/bin/bash
#
# vim:ft=bash

############### Variables ###############

############### Functions ###############

############### Main Part ###############
BASE_URL=${BASE_URL:-"http://172.20.116.200"}
PORT=${PORT:-8020}
ENDPOINT="$BASE_URL:$PORT/v1/videos/sync"
PROMPT="a beautiful woman in red dress dancing on the beach"
HDR_FILE=$(mktemp)

curl -sS -D "$HDR_FILE" -X POST "${ENDPOINT}" \
  -F "prompt=${PROMPT}" \
  -F 'width=1344' \
  -F 'height=768' \
  -F 'aspect_ratio=16:9' \
  -F 'fps=24' \
  -F 'num_inference_steps=50' \
  -F "flow_shift=12.0" \
  -F "audio_flow_shift=3.0" \
  -F "seed=1101" \
  -F 'extra_params={"task":"t2va","duration":5.0}' \
  -o "t2va.mp4"
