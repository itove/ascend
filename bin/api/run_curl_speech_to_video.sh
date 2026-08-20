#!/bin/bash
# Wan2.2 S2V (speech-to-video) curl example using the sync video API.

set -euo pipefail

BASE_URL="${BASE_URL:-http://127.0.0.1:8091}"
OUTPUT_PATH="${OUTPUT_PATH:-s2v_480p_serve.mp4}"
IMAGE_URL="${IMAGE_URL:-http://172.20.29.137:8008/samples/wang_xu_pei.jpg}"
AUDIO_URL="${AUDIO_URL:-http://172.20.29.137:8008/samples/wang_xu_pei.m4a}"
PROMPT="${PROMPT:-A realistic person speaking naturally, maintain the same identity and facial features, stable eyes and mouth, subtle facial expressions, minimal head movement, small hand gestures}"
WIDTH="${WIDTH:-800}"
HEIGHT="${HEIGHT:-1056}"
#WIDTH="${WIDTH:-480}"
#HEIGHT="${HEIGHT:-640}"
NUM_INFERENCE_STEPS="${NUM_INFERENCE_STEPS:-50}"
GUIDANCE_SCALE="${GUIDANCE_SCALE:-2.5}"
FPS="${FPS:-16}"

echo "Sending S2V request..."
echo "  Image URL: $IMAGE_URL"
echo "  Audio URL: $AUDIO_URL"
echo "  Prompt: $PROMPT"
echo "  Resolution: ${WIDTH}x${HEIGHT}"
echo "  Steps: $NUM_INFERENCE_STEPS"
echo "  FPS: $FPS"

IMAGE_REF_JSON="{\"image_url\": \"${IMAGE_URL}\"}"
AUDIO_REF_JSON="{\"audio_url\": \"${AUDIO_URL}\"}"

no_proxy=127.0.0.1 \
curl -X POST "${BASE_URL}/v1/videos/sync" \
  -F "prompt=${PROMPT}" \
  -F "image_reference=${IMAGE_REF_JSON}" \
  -F "audio_reference=${AUDIO_REF_JSON}" \
  -F "width=${WIDTH}" -F "height=${HEIGHT}" \
  -F "num_inference_steps=${NUM_INFERENCE_STEPS}" \
  -F "guidance_scale=${GUIDANCE_SCALE}" \
  -F "fps=${FPS}" \
  --output "${OUTPUT_PATH}"

if [ -f "$OUTPUT_PATH" ] && [ -s "$OUTPUT_PATH" ]; then
    echo "Saved video to ${OUTPUT_PATH} ($(du -h "$OUTPUT_PATH" | cut -f1))"
else
    echo "ERROR: Output file is empty or missing"
    exit 1
fi
