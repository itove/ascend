# test-1

```
$ CONTAINER_NAME=qwen3-asr /mnt/s/ascend/vllm/bin/docker-run-qwen3-asr-1.7b.sh
```

```
# MODEL_PATH=/s/hf/Qwen/Qwen3-ASR-1.7B/ /s/ascend/vllm/bin/serve-qwen3-asr-1.7b.sh
```

```
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) INFO 11-24 03:18:27 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) INFO 11-24 03:18:27 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(EngineCore pid=487) `Qwen3ASRProcessor` defines `feature_extractor_class = 'WhisperFeatureExtractor'`, which is deprecated. Register the correct mapping in `AutoFeatureExtractor` instead.
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) INFO 11-24 03:18:28 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_interleaved', 'mrope_section'}
(EngineCore pid=487) INFO 11-24 03:18:29 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(EngineCore pid=487) INFO 11-24 03:18:31 [vllm.py:999] Asynchronous scheduling is enabled.
(EngineCore pid=487) WARNING 11-24 03:18:31 [vllm.py:1055] Enforce eager set, disabling torch.compile and CUDAGraphs. This is equivalent to setting -cc.mode=none -cc.cudagraph_mode=none
(EngineCore pid=487) WARNING 11-24 03:18:31 [vllm.py:1097] Inductor compilation was disabled by user settings, optimizations settings that are only active during inductor compilation will be ignored.
(EngineCore pid=487) INFO 11-24 03:18:31 [kernel.py:270] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'])
(EngineCore pid=487) INFO 11-24 03:18:31 [vllm.py:1273] Cudagraph is disabled under eager mode
(EngineCore pid=487) INFO 11-24 03:18:31 [utils.py:174] No quantization signature detected from model files for "/s/hf/Qwen/Qwen3-ASR-1.7B/". The model will be loaded as float. To force a quantization method, pass "--quantization <method>" explicitly.
(EngineCore pid=487) INFO 11-24 03:18:31 [platform.py:1277] The timeout interval of the HCCL operator is 1836s. Timeout in seconds for execute_model RPC calls in multiprocessing must be greater than 1836s, Set VLLM_EXECUTE_MODEL_TIMEOUT_SECONDS=3000
(EngineCore pid=487) INFO 11-24 03:18:31 [ascend_config.py:893] Dynamic EPLB is False
(EngineCore pid=487) INFO 11-24 03:18:31 [ascend_config.py:894] The number of redundant experts is 0
(EngineCore pid=487) INFO 11-24 03:18:31 [platform.py:528] Compilation disabled, using eager mode by default
(EngineCore pid=487) INFO 11-24 03:18:31 [platform.py:790] Set PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
(EngineCore pid=487) INFO 11-24 03:18:31 [compilation.py:321] Enabled custom fusions: norm_quant, act_quant
(APIServer pid=172) INFO 11-24 03:18:31 [api_server.py:579] Supported tasks: ['generate', 'transcription']
(APIServer pid=172) WARNING 11-24 03:18:31 [model.py:1502] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1e-06}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=172) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_section', 'mrope_interleaved'}
(APIServer pid=172) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_section', 'mrope_interleaved'}
(APIServer pid=172) INFO 11-24 03:18:31 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(APIServer pid=172) INFO 11-24 03:18:32 [hf.py:548] Detected the chat template content format to be 'openai'. You can set `--chat-template-content-format` to override this.
(APIServer pid=172) INFO 11-24 03:18:32 [base.py:227] Multi-modal warmup completed in 0.028s
(APIServer pid=172) INFO 11-24 03:18:32 [base.py:227] Readonly multi-modal warmup completed in 0.023s
(APIServer pid=172) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_section', 'mrope_interleaved'}
(APIServer pid=172) Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'interleaved', 'mrope_section', 'mrope_interleaved'}
(APIServer pid=172) INFO 11-24 03:18:32 [qwen3_asr.py:417] thinker_config is None. Initializing thinker model with default values
(APIServer pid=172) INFO 11-24 03:18:32 [serving.py:128] Overwriting default completion sampling param with: {'temperature': 1e-06}
(APIServer pid=172) INFO 11-24 03:18:32 [serving.py:128] Overwriting default completion sampling param with: {'temperature': 1e-06}
(APIServer pid=172) INFO 11-24 03:18:32 [api_server.py:583] Starting vLLM server on http://0.0.0.0:8010
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:37] Available routes are:
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /openapi.json, Methods: HEAD, GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /docs, Methods: HEAD, GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: HEAD, GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /redoc, Methods: HEAD, GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/audio/transcriptions, Methods: POST
(APIServer pid=172) INFO 11-24 03:18:32 [launcher.py:46] Route: /v1/audio/translations, Methods: POST
(APIServer pid=172) INFO:     Started server process [172]
(APIServer pid=172) INFO:     Waiting for application startup.
(APIServer pid=172) INFO:     Application startup complete.
```
