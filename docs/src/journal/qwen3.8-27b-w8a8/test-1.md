# test-1
```
$ CONTAINER_NAME=qwen3.8-27b-w8a8 DOCKER_IMAGE_TAG=qwen3.8-a2 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
# MODEL_PATH=/s/modelscope/Eco-Tech/Qwen3.8-27B-w8a8/ /s/ascend/vllm/bin/serve-qwen3.8-27b-w8a8.sh
```

```
#!/bin/bash
#
# vim:ft=bash
# see https://docs.vllm.ai/projects/ascend/en/latest/tutorials/models/Qwen3.8-27B.html

set -e

. /s/ascend/vllm/ENVs
# Load model from ModelScope to speed up download
export VLLM_USE_MODELSCOPE=True
# To reduce memory fragmentation and avoid out of memory
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export HCCL_BUFFSIZE=512
export OMP_PROC_BIND=false
export OMP_NUM_THREADS=1
export TASK_QUEUE_ENABLE=1
export ASCEND_RT_VISIBLE_DEVICES="6,7"

unset USE_MULTI_BLOCK_POOL
unset OMP_PROC_BIND
unset ACL_OP_INIT_MODE
unset TRITON_ALL_BLOCKS_PARALLEL

vllm serve $MODEL_PATH \
    --quantization ascend \
    --host 0.0.0.0 \
    --port 8002 \
    --data-parallel-size 1 \
    --tensor-parallel-size 2 \
    --seed 1024 \
    --served-model-name $MODEL_NAME \
    --max-num-seqs 32 \
    --max-model-len 256000 \
    --max-num-batched-tokens 16384 \
    --trust-remote-code \
    --gpu-memory-utilization 0.90 \
    --enable-prefix-caching \
    --speculative_config '{"method": "qwen3_5_mtp", "num_speculative_tokens": 3, "enforce_eager": true}' \
    --compilation-config '{"cudagraph_mode":"FULL_DECODE_ONLY"}' \
    --additional-config '{"enable_cpu_binding":true, "ascend_scheduler_config": {"enabled": true}, "enable_prefill_optimizations": true}' \
    --tool-call-parser "qwen3_coder" \
    --reasoning-parser qwen3 \
    --enable-auto-tool-choice \
    --async-scheduling
```
```
ndicate the inputs were passed in head-first format [B, H, T, ...] when head_first=False was specified. Please verify your input tensor format matches the expected shape [B, T, H, ...].
(Worker_TP1 pid=489)   return fn(*args, **kwargs)
(EngineCore pid=442) INFO 11-24 11:07:29 [shm_broadcast.py:705] No available shared memory broadcast block found in 60 seconds. This typically happens when some processes are hanging or doing some time-consuming work (e.g. compilation, weight/kv cache quantization).
(Worker_TP1 pid=489) /usr/local/python3.12.13/lib/python3.12/site-packages/torch/_dynamo/eval_frame.py:1181: UserWarning: chunk_gated_delta_rule: Input tensor shape suggests potential format mismatch: seq_len (4) < num_heads (8). This may indicate the inputs were passed in head-first format [B, H, T, ...] when head_first=False was specified. Please verify your input tensor format matches the expected shape [B, T, H, ...].
(Worker_TP1 pid=489)   return fn(*args, **kwargs)
(Worker_TP0 pid=470) /usr/local/python3.12.13/lib/python3.12/site-packages/torch/_dynamo/eval_frame.py:1181: UserWarning: chunk_gated_delta_rule: Input tensor shape suggests potential format mismatch: seq_len (4) < num_heads (8). This may indicate the inputs were passed in head-first format [B, H, T, ...] when head_first=False was specified. Please verify your input tensor format matches the expected shape [B, T, H, ...].
(Worker_TP0 pid=470)   return fn(*args, **kwargs)
Capturing CUDA graphs (decode, FULL): 100%|████████████████████████████████████████████| 17/17 [02:04<00:00,  7.30s/it]
(Worker_TP0 pid=470) INFO 11-24 11:07:34 [gpu_model_runner.py:6585] Graph capturing finished in 126 secs, took 0.59 GiB
(Worker_TP0 pid=470) INFO 11-24 11:07:34 [worker.py:771] Free memory on device (60.63/60.97 GiB) on startup. Desired GPU memory utilization is (0.9, 54.87 GiB). Actual usage: 16.28 GiB for weights, 1.74 GiB for peak activation, 0.48 GiB for non-torch memory, 0.59 GiB for NPU graph memory. Replace gpu_memory_utilization with `--kv-cache-memory=38266694348` (35.64 GiB) to fit into requested memory, or `--kv-cache-memory=44452843008` (41.4 GiB) to fully utilize NPU free memory. Current KV cache memory: 36.38 GiB.
(Worker_TP1 pid=489) INFO 11-24 11:07:35 [worker.py:771] Free memory on device (60.65/60.97 GiB) on startup. Desired GPU memory utilization is (0.9, 54.87 GiB). Actual usage: 16.28 GiB for weights, 1.74 GiB for peak activation, 0.48 GiB for non-torch memory, 0.59 GiB for NPU graph memory. Replace gpu_memory_utilization with `--kv-cache-memory=38267202252` (35.64 GiB) to fit into requested memory, or `--kv-cache-memory=44466802176` (41.41 GiB) to fully utilize NPU free memory. Current KV cache memory: 36.38 GiB.
(Worker_TP0 pid=470) INFO 11-24 11:07:36 [cpu_binding.py:542] [cpu_bind_mode] mode=topo_affinity rank=0 visible_npus=[6, 7]
(Worker_TP0 pid=470) INFO 11-24 11:07:36 [cpu_binding.py:626] The CPU allocation plan is as follows:
(Worker_TP0 pid=470) INFO 11-24 11:07:36 [cpu_binding.py:641] NPU6: main=[50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93]  acl=[94]  release=[[95]]
(Worker_TP0 pid=470) INFO 11-24 11:07:36 [cpu_binding.py:667] [migrate] NPU:6 -> NUMA [1]
(Worker_TP1 pid=489) INFO 11-24 11:07:37 [cpu_binding.py:542] [cpu_bind_mode] mode=topo_affinity rank=1 visible_npus=[6, 7]
(Worker_TP1 pid=489) INFO 11-24 11:07:37 [cpu_binding.py:626] The CPU allocation plan is as follows:
(Worker_TP1 pid=489) INFO 11-24 11:07:37 [cpu_binding.py:641] NPU7: main=[98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141]  acl=[142]  release=[[143]]
(Worker_TP1 pid=489) INFO 11-24 11:07:37 [cpu_binding.py:667] [migrate] NPU:7 -> NUMA [2]
(Worker_TP1 pid=489) WARNING 11-24 11:07:42 [cpu_binding.py:775] The sq_send_trigger_irq is not found. npu=7.
(Worker_TP0 pid=470) WARNING 11-24 11:07:46 [cpu_binding.py:775] The sq_send_trigger_irq is not found. npu=6.
(EngineCore pid=442) INFO 11-24 11:07:46 [core.py:306] init engine (profile, create kv cache, warmup model) took 259.06 s (compilation: 94.73 s)
(EngineCore pid=442) `Qwen2VLImageProcessorFast` is deprecated. The `Fast` suffix for image processors has been removed; use `Qwen2VLImageProcessor` instead.
(EngineCore pid=442) The `use_fast` parameter is deprecated and will be removed in a future version. Use `backend="torchvision"` instead of `use_fast=True`, or `backend="pil"` instead of `use_fast=False`.
(EngineCore pid=442) INFO 11-24 11:07:54 [vllm.py:999] Asynchronous scheduling is enabled.
(EngineCore pid=442) WARNING 11-24 11:07:54 [vllm.py:1023] Disabling cascade attention (not yet compatible with async speculative decoding).
(EngineCore pid=442) INFO 11-24 11:07:54 [kernel.py:270] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'])
(EngineCore pid=442) WARNING 11-24 11:07:54 [platform.py:1067] GPU-specific parameter is not supported on Ascend. parameter=disable_cascade_attn, value=True, action: resetting to False.
(EngineCore pid=442) INFO 11-24 11:07:54 [platform.py:1277] The timeout interval of the HCCL operator is 1836s. Timeout in seconds for execute_model RPC calls in multiprocessing must be greater than 1836s, Set VLLM_EXECUTE_MODEL_TIMEOUT_SECONDS=3000
(EngineCore pid=442) INFO 11-24 11:07:54 [ascend_config.py:893] Dynamic EPLB is False
(EngineCore pid=442) INFO 11-24 11:07:54 [ascend_config.py:894] The number of redundant experts is 0
(EngineCore pid=442) INFO 11-24 11:07:54 [platform.py:790] Set PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
(EngineCore pid=442) INFO 11-24 11:07:54 [compilation.py:321] Enabled custom fusions: norm_quant, act_quant
(APIServer pid=172) INFO 11-24 11:07:54 [api_server.py:579] Supported tasks: ['generate']
(APIServer pid=172) INFO 11-24 11:07:55 [parser_manager.py:37] "auto" tool choice has been enabled.
(APIServer pid=172) WARNING 11-24 11:07:55 [model.py:1502] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1.0, 'top_k': 20, 'top_p': 0.95}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=172) INFO 11-24 11:07:57 [hf.py:548] Detected the chat template content format to be 'openai'. You can set `--chat-template-content-format` to override this.
(APIServer pid=172) INFO 11-24 11:08:11 [base.py:227] Multi-modal warmup completed in 14.660s
(APIServer pid=172) INFO 11-24 11:08:14 [base.py:227] Readonly multi-modal warmup completed in 2.180s
(APIServer pid=172) INFO 11-24 11:08:14 [api_server.py:583] Starting vLLM server on http://0.0.0.0:8002
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:37] Available routes are:
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /openapi.json, Methods: GET, HEAD
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /docs, Methods: GET, HEAD
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: GET, HEAD
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /redoc, Methods: GET, HEAD
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=172) INFO 11-24 11:08:14 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=172) INFO:     Started server process [172]
(APIServer pid=172) INFO:     Waiting for application startup.
(APIServer pid=172) INFO:     Application startup complete.
```
