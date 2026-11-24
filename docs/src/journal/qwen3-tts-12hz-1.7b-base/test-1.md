# test-1

```
$ CONTAINER_NAME=qwen3-tts-base DOCKER_IMAGE_TAG=v0.32.0 /mnt/s/ascend/vllm/bin/docker-run-qwen3-tts-12hz-1.7b-base.sh
```

```
# MODEL_PATH=/s/hf/Qwen/Qwen3-TTS-12Hz-1.7B-Base/ /s/ascend/vllm/bin/serve-qwen3-tts-12hz-1.7b-base.sh
```

```
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:441] code_predictor_config is None. Initializing code_predictor model with default values
[transformers] `layer_type_validation` is deprecated and will be removed in v5.20. Use `PreTrainedConfig.validate_layer_type` instead
(APIServer pid=89) INFO 11-24 03:38:40 [serving_speech.py:363] Speech cache configuration: SpeechCacheConfig(resolve_max_bytes=4294967296, resolve_max_entries=2048, speaker_max_bytes=536870912)
(APIServer pid=89) INFO 11-24 03:38:40 [speaker_cache.py:245] Speaker cache ready (max_bytes=536870912)
(APIServer pid=89) INFO 11-24 03:38:40 [serving_speech.py:379] Speaker storage: dir=/root/.cache/vllm-omni/speakers, max_speakers=1000, restored=0
(APIServer pid=89) INFO 11-24 03:38:40 [qwen3_tts.py:176] Qwen3-TTS default codec budgets (frames): Base=max(192, 12 * text_tokens), CustomVoice=max(400, 40 * text_tokens), VoiceDesign=max(400, 40 * text_tokens)
(APIServer pid=89) INFO 11-24 03:38:40 [serving_speech.py:651] Resolved TTS serving adapter: Qwen3TTSAdapter
(APIServer pid=89) WARNING 11-24 03:38:40 [capabilities.py:35] No speakers found in config (checked spk_id and speaker_id)
(APIServer pid=89) INFO 11-24 03:38:40 [capabilities.py:55] Loaded codec frame rate: 12.5 Hz (output_sample_rate=24000, encode_downsample_rate=1920)
(APIServer pid=89) INFO 11-24 03:38:40 [serving_speech.py:658] Loaded 0 supported speakers: []
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:487] talker_config is None. Initializing talker model with default values
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:490] speaker_encoder_config is None. Initializing talker model with default values
[transformers] `layer_type_validation` is deprecated and will be removed in v5.20. Use `PreTrainedConfig.validate_layer_type` instead
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:441] code_predictor_config is None. Initializing code_predictor model with default values
[transformers] `layer_type_validation` is deprecated and will be removed in v5.20. Use `PreTrainedConfig.validate_layer_type` instead
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:441] code_predictor_config is None. Initializing code_predictor model with default values
[transformers] `layer_type_validation` is deprecated and will be removed in v5.20. Use `PreTrainedConfig.validate_layer_type` instead
(APIServer pid=89) INFO 11-24 03:38:40 [configuration_qwen3_tts.py:441] code_predictor_config is None. Initializing code_predictor model with default values
[transformers] `layer_type_validation` is deprecated and will be removed in v5.20. Use `PreTrainedConfig.validate_layer_type` instead
(APIServer pid=89) INFO 11-24 03:38:40 [serving_video.py:178] Video response frame conversion pool configured: workers=8
(APIServer pid=89) INFO 11-24 03:38:40 [api_server.py:476] Starting vLLM API server 0 on http://0.0.0.0:8011
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:186] Available routes are:
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /openapi.json, Methods: HEAD, GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /docs, Methods: HEAD, GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /docs/oauth2-redirect, Methods: HEAD, GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /redoc, Methods: HEAD, GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /load, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /version, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /kv_event_sources, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /metrics, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /tokenize, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /detokenize, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/systemone, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /ping, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /ping, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /invocations, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/responses, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/completions, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/messages, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /generative_scoring, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/messages/render, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/completions/render, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/responses/render, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/chat/completions/derender, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/completions/derender, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /inference/v1/generate, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /inference/v1/abort_requests, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/chat/completions, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/speech, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/speech/batch, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/generate, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/voices, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/voices, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/audio/voices/{name}, Methods: DELETE
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/realtime/sessions, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/realtime/sessions/{session_id}/step, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/realtime/sessions/{session_id}/reset, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/realtime/sessions/{session_id}/close, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/realtime/sessions/{session_id}/status, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /health, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/models, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/images/generations, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/images/edits, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos/sync, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos/{video_id}, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos/{video_id}, Methods: DELETE
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/videos/{video_id}/content, Methods: GET
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/omni/sleep, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:195] Route: /v1/omni/wakeup, Methods: POST
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/audio/speech/stream, Endpoint: streaming_speech
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/video/chat/stream, Endpoint: streaming_video_chat
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/realtime/video, Endpoint: streaming_video_output
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/realtime, Endpoint: realtime_websocket
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/duplex, Endpoint: duplex_websocket
(APIServer pid=89) INFO 11-24 03:38:40 [launcher.py:206] Route: /v1/realtime/robot/openpi, Endpoint: realtime_robot_openpi
INFO:     Started server process [89]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```
