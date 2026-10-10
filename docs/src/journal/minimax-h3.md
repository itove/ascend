### links
* [昇腾0 Dday支持MiniMax H3，加速SOTA视频模型走向“商业级生产”](https://www.hiascend.com/activities/dynamic-news/755)
* [vllm-omni](ttps://gitcode.com/Ascend/MindIE-SD/blob/dev/examples/minimax-h3/infer.md)

### docker run
```bash
SHM_SIZE=2000 CONTAINER_NAME=minimix-h3 DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.28.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

### serve
```bash
# serve-minimax-h3.sh

set -e

. /s/ascend/vllm/ENVs

export PORT=9098
export VLLM_WORKER_MULTIPROC_METHOD=spawn
export VLLM_OMNI_VIDEO_SYNC_TIMEOUT=4000
export PYTHONDONTWRITEBYTECODE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export MINDIE_SD_FA_TYPE="ascend_laser_attention"
export HCCL_NPU_SOCKET_PORT_RANGE="auto"

vllm serve $MODEL_PATH \
  --served-model-name $MODEL_NAME \
  --omni \
  --host 0.0.0.0 \
  --port "${PORT}" \
  --trust-remote-code \
  --task-type fl2va \
  --num-gpus 8 \
  --usp 8 \
  --ring 1 \
  --text-encoder-tp-size 8 \
  --vae-parallel-mode tile \
  --vae-use-tiling \
  --vae-patch-parallel-size 8 \
  --enable-distributed-layerwise-offload \
  --enable-diffusion-pipeline-profiler \
  --diffusion-quantization-config '{"transformer":{"method":"int8"}}' \
  --diffusion-attention-config '{"default": {"backend": "RAINFUSION_ATTN",
      "block_sparse": {"sparsity": 0.8, "start_step": 12}}}'

```

### error
```
(DiffusionWorker_SP3 pid=237) RuntimeError: create_config:../torch_npu/csrc/distributed/HCCLUtils.cpp:140 HCCL function error: hcclCommInitRootInfoConfig(numRanks, &rootInfo, rank, config, &(comm->hcclComm_)), error code is 1
(DiffusionWorker_SP3 pid=237) [ERROR] 2026-10-09-08:38:05 (PID:237, Device:3, RankID:3) ERR02200 DIST call hccl api failed.
(DiffusionWorker_SP3 pid=237) [PID: 237] 2026-10-09-08:38:04.978.003 Communication_Error_Ranktable_Detect(EI0015): Failed to collect cluster information of the communicator based on rootInfo detection. Reason: No rank in the communicator can connect to the root node within the timeout period. List of unconnected ranks: "[1,7,]".
(DiffusionWorker_SP3 pid=237)         Solution: 1. Check whether all ranks in the communicator have delivered the communicator creation interface. 2. Check the connectivity between the host networks of all nodes and the server node. 3. Check whether the HCCL_SOCKET_IFNAME environment variable of all nodes is correctly configured. 4. Increase the timeout by configuring the HCCL_CONNECT_TIMEOUT environment variable.
```

### omni v0.30.0
```
[W1010 01:24:20.395913963 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
INFO 10-10 01:24:26 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:24:26 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:24:26 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugi
ns to load.
INFO 10-10 01:24:26 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:24:26 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:24:58 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek
V4 Ascend indexer K cache dtype).
INFO 10-10 01:24:58 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend M
LA KV cache dtype).
INFO 10-10 01:24:58 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through
 the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error repla
ces the `!!!!` decode-time collapse.
INFO 10-10 01:24:58 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:24:58 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to a
ll platforms.
INFO 10-10 01:25:07 [main.py:33] Delegating entrypoint handling to vllm-omni
2026-10-10 01:25:07,619 - 84 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: defaul
t 1
INFO 10-10 01:25:07 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.Mode
lNetLoaderElastic'>` with load format `netloader`
INFO 10-10 01:25:07 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RFork
ModelLoader'>` with load format `rfork`
WARNING 10-10 01:25:08 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module na
med 'vllm._deepselect_C'
INFO 10-10 01:25:08 [serve.py:314] Detected diffusion model: /s/hf/MiniMaxAI/MiniMax-H3/
INFO 10-10 01:25:08 [logo.py:52]        █     █     █▄   ▄█       ▄▀▀▀▀▄ █▄   ▄█ █▄    █ ▀█▀
INFO 10-10 01:25:08 [logo.py:52]  ▄▄ ▄█ █     █     █ ▀▄▀ █  ▄▄▄  █    █ █ ▀▄▀ █ █ ▀▄  █  █
INFO 10-10 01:25:08 [logo.py:52]   █▄█▀ █     █     █     █       █    █ █     █ █   ▀▄█  █
INFO 10-10 01:25:08 [logo.py:52]    ▀▀  ▀▀▀▀▀ ▀▀▀▀▀ ▀     ▀        ▀▀▀▀  ▀     ▀ ▀     ▀ ▀▀▀
INFO 10-10 01:25:08 [logo.py:52]
(APIServer pid=84) INFO 10-10 01:25:08 [api_utils.py:347] vLLM server version 0.30.0, serving model /s/hf/MiniMaxAI/Mini
Max-H3/
(APIServer pid=84) INFO 10-10 01:25:08 [api_utils.py:286] non-default args: {'model_tag': '/s/hf/MiniMaxAI/MiniMax-H3/',
 'host': '0.0.0.0', 'port': 8010, 'model': '/s/hf/MiniMaxAI/MiniMax-H3/', 'trust_remote_code': True, 'served_model_name'
: ['minimax-h3']}
(APIServer pid=84) INFO 10-10 01:25:08 [omni_base.py:208] [AsyncOmni] Initializing with model /s/hf/MiniMaxAI/MiniMax-H3
/
(APIServer pid=84) INFO 10-10 01:25:08 [omni_engine_base.py:163] [OmniEngine] Initializing with model /s/hf/MiniMaxAI/Mi
niMax-H3/
(APIServer pid=84) INFO 10-10 01:25:08 [config_factory.py:697] Resolved generic diffusion final_output_type='video' for
model_class_name='MiniMaxH3ModularPipeline'.
(APIServer pid=84) INFO 10-10 01:25:09 [omni_engine_base.py:312] [OmniEngine] Launching Orchestrator thread with 1 stage
s
(APIServer pid=84) INFO 10-10 01:25:09 [factory.py:382] Per-component quantization: {'transformer': 'int8'}
(APIServer pid=84) WARNING 10-10 01:25:10 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No modul
e named 'flashinfer'
(APIServer pid=84) INFO 10-10 01:25:11 [multiproc_executor.py:372] Starting server...
[W1010 01:25:14.525960955 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.584274144 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.616730693 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.626436756 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.631094920 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.640942485 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.648124239 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
[W1010 01:25:14.663629739 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for s
ymbol resolution. (function operator())
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugi
ns to load.
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugi
ns to load.
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:52] Available plugins for group vllm.platform_plugins:
INFO 10-10 01:25:20 [__init__.py:54] - ascend -> vllm_ascend:register
INFO 10-10 01:25:20 [__init__.py:57] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [__init__.py:272] Platform plugin ascend is activated
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:20 [platform.py:71] Breakable CUDAGraph on Ascend is opt-in; using VLLM_USE_BREAKABLE_CUDAGRAPH=0.
INFO 10-10 01:25:35 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:35 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:35 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:35 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:35 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:36 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:36 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:36 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:36 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:36 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:36 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:36 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:36 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:36 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:36 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:36 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:36 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:36 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:36 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:37 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch_indexer_kv_dtype.py:102] Patched AttentionConfig.indexer_kv_dtype to accept 'int8' (DeepSeek V4 Ascend indexer K cache dtype).
INFO 10-10 01:25:37 [patch_kv_cache_dtype.py:115] Patched CacheConfig.cache_dtype to accept 'int8' (DeepSeek V4 Ascend MLA KV cache dtype).
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch.py:253] NVFP4 W4A4 weight_scale NaN-clamp: skipped — upstream serves ModelOpt linears through the generic ModelOptLinearMethod and rejects any NaN weight_scale (unloaded-scale sentinel), so a load-time error replaces the `!!!!` decode-time collapse.
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
INFO 10-10 01:25:37 [patch.py:551] inductor factorable-divisibility patch: skipped (upstream already proves it).
INFO 10-10 01:25:37 [patch.py:630] [cumem-cuda] CuMemAllocator._python_free_callback patched: asleep guard extended to all platforms.
WARNING 10-10 01:25:40 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:41 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
WARNING 10-10 01:25:42 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
(DiffusionWorker pid=159) 2026-10-10 01:25:43,029 - 159 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [diffusion_worker.py:1169] Worker 6 created result MessageQueue
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=159) WARNING 10-10 01:25:43 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=159) INFO 10-10 01:25:43 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=156) 2026-10-10 01:25:43,858 - 156 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [diffusion_worker.py:1169] Worker 3 created result MessageQueue
(DiffusionWorker pid=154) 2026-10-10 01:25:44,467 - 154 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=156) WARNING 10-10 01:25:44 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=156) INFO 10-10 01:25:44 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=154) INFO 10-10 01:25:44 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=154) INFO 10-10 01:25:44 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=154) INFO 10-10 01:25:44 [diffusion_worker.py:1169] Worker 1 created result MessageQueue
(DiffusionWorker pid=158) 2026-10-10 01:25:44,948 - 158 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=159) WARNING 10-10 01:25:45 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=160) 2026-10-10 01:25:45,090 - 160 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=157) 2026-10-10 01:25:45,098 - 157 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=153) 2026-10-10 01:25:45,130 - 153 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=154) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=154) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=154) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=154) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=154) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [diffusion_worker.py:1169] Worker 5 created result MessageQueue
(DiffusionWorker pid=155) 2026-10-10 01:25:45,222 - 155 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.30.0+empty: default 1
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [diffusion_worker.py:1169] Worker 7 created result MessageQueue
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [diffusion_worker.py:1169] Worker 4 created result MessageQueue
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [diffusion_worker.py:1169] Worker 0 created result MessageQueue
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [__init__.py:112] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [diffusion_worker.py:1169] Worker 2 created result MessageQueue
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=158) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=158) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=159) WARNING 10-10 01:25:45 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOp
PriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=160) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=160) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=157) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=157) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=153) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=153) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=156) WARNING 10-10 01:25:45 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [scheduler.py:288] Chunked prefill is enabled with max_num_batched_tokens=2048.
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=155) WARNING 10-10 01:25:45 [platform.py:473] Model config is missing. Skipping Ascend-specific config updates.
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(DiffusionWorker pid=155) INFO 10-10 01:25:45 [diffusion_worker.py:346] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(DiffusionWorker pid=154) WARNING 10-10 01:25:46 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=156) WARNING 10-10 01:25:46 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=158) WARNING 10-10 01:25:46 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=160) WARNING 10-10 01:25:47 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=157) WARNING 10-10 01:25:47 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=153) WARNING 10-10 01:25:47 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=154) WARNING 10-10 01:25:47 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=155) WARNING 10-10 01:25:47 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(DiffusionWorker pid=159) INFO 10-10 01:25:47 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=159) INFO 10-10 01:25:47 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=159) INFO 10-10 01:25:47 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=158) WARNING 10-10 01:25:47 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=160) WARNING 10-10 01:25:47 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=153) WARNING 10-10 01:25:48 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=157) WARNING 10-10 01:25:48 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=156) INFO 10-10 01:25:48 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=156) INFO 10-10 01:25:48 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=156) INFO 10-10 01:25:48 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=155) WARNING 10-10 01:25:48 [indexer_topk.py:29] Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(DiffusionWorker pid=154) INFO 10-10 01:25:49 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=154) INFO 10-10 01:25:49 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=154) INFO 10-10 01:25:49 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=160) INFO 10-10 01:25:49 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=160) INFO 10-10 01:25:49 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=160) INFO 10-10 01:25:49 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=153) INFO 10-10 01:25:49 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=153) INFO 10-10 01:25:49 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=153) INFO 10-10 01:25:49 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=158) INFO 10-10 01:25:49 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=158) INFO 10-10 01:25:49 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=158) INFO 10-10 01:25:49 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=157) INFO 10-10 01:25:49 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=157) INFO 10-10 01:25:49 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=157) INFO 10-10 01:25:49 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
(DiffusionWorker pid=155) INFO 10-10 01:25:50 [ascend_config.py:231] Dynamic EPLB is False
(DiffusionWorker pid=155) INFO 10-10 01:25:50 [ascend_config.py:232] The number of redundant experts is 0
(DiffusionWorker pid=155) INFO 10-10 01:25:50 [ascend_config.py:624] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
[Gloo] Rank 0 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 3 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 1 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 2 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 4 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 5 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 6 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 7 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 4 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 7 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 0 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 1 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 2 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 3 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 5 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 6 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
(DiffusionWorker pid=160) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 7: Initialized device and distributed environment.
(DiffusionWorker pid=153) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 0: Initialized device and distributed environment.
(DiffusionWorker pid=154) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 1: Initialized device and distributed environment.
(DiffusionWorker pid=155) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 2: Initialized device and distributed environment.
(DiffusionWorker pid=159) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 6: Initialized device and distributed environment.
(DiffusionWorker pid=158) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 5: Initialized device and distributed environment.
(DiffusionWorker pid=156) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 3: Initialized device and distributed environment.
(DiffusionWorker pid=157) INFO 10-10 01:26:22 [diffusion_worker.py:358] Worker 4: Initialized device and distributed environment.
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
(DiffusionWorker pid=159) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=160) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=158) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=157) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=156) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=155) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=154) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=153) INFO 10-10 01:26:22 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=8, ulysses=8, ring=1, use_ulysses_low=True).
(DiffusionWorker pid=159) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 6: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[6]
(DiffusionWorker pid=160) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 7: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[7]
(DiffusionWorker pid=156) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 3: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[3]
(DiffusionWorker pid=155) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 2: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[2]
(DiffusionWorker pid=157) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 4: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[4]
(DiffusionWorker pid=154) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 1: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[1]
(DiffusionWorker pid=153) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 0: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[0]
(DiffusionWorker pid=158) INFO 10-10 01:26:22 [parallel_state.py:652] SP group details for rank 5: sp_group=[0, 1, 2, 3, 4, 5, 6, 7], ulysses_group=[0, 1, 2, 3, 4, 5, 6, 7], ring_group=[5]
[Gloo] Rank 0 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 2 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 5 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 4 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 1 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 6 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 3 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 7 is connected to 7 peer ranks. Expected number of connected peer ranks is : 7
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
(DiffusionWorker_SP6 pid=159) INFO 10-10 01:26:23 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP1 pid=154) INFO 10-10 01:26:23 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP7 pid=160) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP2 pid=155) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP0 pid=153) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP5 pid=158) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP4 pid=157) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP3 pid=156) INFO 10-10 01:26:24 [diffusers_loader.py:671] Online quantization with CPU offload, using npu for weight loading (will offload back to CPU)
(DiffusionWorker_SP6 pid=159) Process DiffusionWorker-6:
(DiffusionWorker_SP6 pid=159) Traceback (most recent call last):
(DiffusionWorker_SP6 pid=159)   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/process.py", line 314, in _bootstrap
(DiffusionWorker_SP6 pid=159)     self.run()
(DiffusionWorker_SP6 pid=159)   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/process.py", line 108, in run
(DiffusionWorker_SP6 pid=159)     self._target(*self._args, **self._kwargs)
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1634, in worker_main
(DiffusionWorker_SP6 pid=159)     worker_proc = WorkerProc(
(DiffusionWorker_SP6 pid=159)                   ^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1174, in __init__
(DiffusionWorker_SP6 pid=159)     self.worker = self._create_worker(gpu_id, od_config, worker_extension_cls, custom_pipeline_args)
(DiffusionWorker_SP6 pid=159)                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1209, in _create_worker
(DiffusionWorker_SP6 pid=159)     wrapper = WorkerWrapperBase(
(DiffusionWorker_SP6 pid=159)               ^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1706, in __init__
(DiffusionWorker_SP6 pid=159)     worker = worker_class(
(DiffusionWorker_SP6 pid=159)              ^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 308, in __init__
(DiffusionWorker_SP6 pid=159)     self.load_model(load_format=self.od_config.diffusion_load_format)
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 430, in load_model
(DiffusionWorker_SP6 pid=159)     self.model_runner.load_model(
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_model_runner.py", line 344, in load_model
(DiffusionWorker_SP6 pid=159)     self.pipeline = model_loader.load_model(
(DiffusionWorker_SP6 pid=159)                     ^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/model_loader/diffusers_loader.py", line 696, in load_model
(DiffusionWorker_SP6 pid=159)     model = self._init_from_load_format(load_format, target_device, custom_pipeline_name, is_hsdp=False)
(DiffusionWorker_SP6 pid=159)             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/model_loader/diffusers_loader.py", line 1218, in _init_from_load_format
(DiffusionWorker_SP6 pid=159)     model = initialize_model(self.od_config)
(DiffusionWorker_SP6 pid=159)             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/registry.py", line 465, in initialize_model
(DiffusionWorker_SP6 pid=159)     model = model_class(od_config=od_config)
(DiffusionWorker_SP6 pid=159)             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/models/minimax_h3/pipeline_minimax_h3.py", line 882, in __init__
(DiffusionWorker_SP6 pid=159)     json.loads((model_root / "fastvideo_inference.json").read_text(encoding="utf-8"))
(DiffusionWorker_SP6 pid=159)                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/usr/local/python3.12.13/lib/python3.12/pathlib.py", line 1027, in read_text
(DiffusionWorker_SP6 pid=159)     with self.open(mode='r', encoding=encoding, errors=errors) as f:
(DiffusionWorker_SP6 pid=159)          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159)   File "/usr/local/python3.12.13/lib/python3.12/pathlib.py", line 1013, in open
(DiffusionWorker_SP6 pid=159)     return io.open(self, mode, buffering, encoding, errors, newline)
(DiffusionWorker_SP6 pid=159)            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP6 pid=159) FileNotFoundError: [Errno 2] No such file or directory: '/s/hf/MiniMaxAI/MiniMax-H3/fastvideo_inference.json'
...
(APIServer pid=84) ERROR 10-10 01:26:34 [multiproc_executor.py:420] Rank 0 scheduler is dead. Please check if there are
relevant logs.
(APIServer pid=84) ERROR 10-10 01:26:34 [multiproc_executor.py:422] Exit code: 1
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308] [StageRuntime] Stage initialization failed; shutting down
 0 initialized client(s)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308] Traceback (most recent call last):
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_
runtime.py", line 295, in initialize
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     initialized_clients = self._initialize_stage_replicas
(stage_plans, self._stage_init_timeout)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_
runtime.py", line 885, in _initialize_stage_replicas
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     raise primary_exc
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_
runtime.py", line 846, in _init_group
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     client = self._initialize_replica(
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1075, in _initialize_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1196, in _initialize_local_diffusion_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     client, resources = launch_diffusion_stage_replica(
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     client = initialize_diffusion_stage(
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2035, in initialize_diffusion_stage
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     return InlineStageDiffusionClient(model, od_config, metadata)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     self._engine = DiffusionEngine.make_engine(self.od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1078, in make_engine
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     engine = engine_class(config, scheduler=scheduler)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 272, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     self._init_executor(od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 350, in _init_executor
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     self.executor = executor_class(od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]                     ^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/abstract.py", line 82, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     self._init_executor()
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/multiproc_executor.py", line 186, in _init_executor
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     processes, result_handles = self._launch_workers(broadcast_handle, self.wake_events)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/multiproc_executor.py", line 418, in _launch_workers
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     data = reader.recv()
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]            ^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 250, in recv
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     buf = self._recv_bytes()
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]           ^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 430, in _recv_bytes
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     buf = self._recv(4)
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]           ^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 399, in _recv
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308]     raise EOFError
(APIServer pid=84) ERROR 10-10 01:26:34 [stage_runtime.py:308] EOFError
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478] [OmniEngine] Orchestrator thread crashed
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478] Traceback (most recent call last):
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 472, in _bootstrap_orchestrator
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     loop.run_until_complete(_run_orchestrator())
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 691, in run_until_complete
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     return future.result()
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 445, in _run_orchestrator
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self._initialize_stages(stage_init_timeout)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 392, in _initialize_stages
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self._runtime.initialize()
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 314, in initialize
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     raise exc
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 295, in initialize
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     initialized_clients = self._initialize_stage_replicas(stage_plans, self._stage_init_timeout)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 885, in _initialize_stage_replicas
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     raise primary_exc
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 846, in _init_group
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     client = self._initialize_replica(
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]              ^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1075, in _initialize_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1196, in _initialize_local_diffusion_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     client, resources = launch_diffusion_stage_replica(
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     client = initialize_diffusion_stage(
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2035, in initialize_diffusion_stage
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     return InlineStageDiffusionClient(model, od_config, metadata)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self._engine = DiffusionEngine.make_engine(self.od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1078, in make_engine
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     engine = engine_class(config, scheduler=scheduler)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 272, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self._init_executor(od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 350, in _init_executor
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self.executor = executor_class(od_config)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]                     ^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/abstract.py", line 82, in __init__
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     self._init_executor()
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/multiproc_executor.py", line 186, in _init_executor
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     processes, result_handles = self._launch_workers(broadcast_handle, self.wake_events)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/multiproc_executor.py", line 418, in _launch_workers
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     data = reader.recv()
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]            ^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 250, in recv
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     buf = self._recv_bytes()
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]           ^^^^^^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 430, in _recv_bytes
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     buf = self._recv(4)
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]           ^^^^^^^^^^^^^
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/connection.py", line 399, in _recv
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478]     raise EOFError
(APIServer pid=84) ERROR 10-10 01:26:34 [omni_engine_base.py:478] EOFError
(APIServer pid=84) INFO 10-10 01:26:34 [omni_engine_base.py:1151] [OmniEngine] Shutting down Orchestrator
(APIServer pid=84) Exception in thread orchestrator:
(APIServer pid=84) Traceback (most recent call last):
(APIServer pid=84)   File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1075, in _bootstrap_inner
(APIServer pid=84)     self.run()
(APIServer pid=84)   File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1012, in run
```

### Fix 1
```
vim /vllm-workspace/vllm-omni/vllm_omni/model_executor/models/minimax_h3/checkpoint.py
# replace
return (path / "modular_model_index.json").is_file() or (path / "fastvideo_inference.json").is_file()
# with:
return (path / "fastvideo_inference.json").is_file()
```

```
(DiffusionWorker_SP6 pid=1118) INFO 10-10 01:49:42 [diffusion_model_runner.py:449] Model runner: Initialization complete
.
(DiffusionWorker_SP7 pid=1119) Process DiffusionWorker-7:
(DiffusionWorker_SP7 pid=1119) Traceback (most recent call last):
(DiffusionWorker_SP7 pid=1119)   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/process.py", line 314, in
 _bootstrap
(DiffusionWorker_SP7 pid=1119)     self.run()
(DiffusionWorker_SP7 pid=1119)   File "/usr/local/python3.12.13/lib/python3.12/multiprocessing/process.py", line 108, in
 run
(DiffusionWorker_SP7 pid=1119)     self._target(*self._args, **self._kwargs)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1
634, in worker_main
(DiffusionWorker_SP7 pid=1119)     worker_proc = WorkerProc(
(DiffusionWorker_SP7 pid=1119)                   ^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1
174, in __init__
(DiffusionWorker_SP7 pid=1119)     self.worker = self._create_worker(gpu_id, od_config, worker_extension_cls, custom_pip
eline_args)
(DiffusionWorker_SP7 pid=1119)                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1
209, in _create_worker
(DiffusionWorker_SP7 pid=1119)     wrapper = WorkerWrapperBase(
(DiffusionWorker_SP7 pid=1119)               ^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1
706, in __init__
(DiffusionWorker_SP7 pid=1119)     worker = worker_class(
(DiffusionWorker_SP7 pid=1119)              ^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 3
08, in __init__
(DiffusionWorker_SP7 pid=1119)     self.load_model(load_format=self.od_config.diffusion_load_format)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 4
30, in load_model
(DiffusionWorker_SP7 pid=1119)     self.model_runner.load_model(
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_model_runner.py",
line 378, in load_model
(DiffusionWorker_SP7 pid=1119)     self.pipeline, self.offload_backend = enable_offload_backend(
(DiffusionWorker_SP7 pid=1119)                                           ^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/__init__.py", line 196, i
n enable_offload_backend
(DiffusionWorker_SP7 pid=1119)     return pipeline, enable_once(pipeline, startup_state)
(DiffusionWorker_SP7 pid=1119)                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/__init__.py", line 180, i
n enable_once
(DiffusionWorker_SP7 pid=1119)     backend.enable(model)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 1608, in enable
(DiffusionWorker_SP7 pid=1119)     self._enable(pipeline)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 1692, in _enable
(DiffusionWorker_SP7 pid=1119)     prepare_pipeline_components(
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/component_utils.py", line
 167, in prepare_pipeline_components
(DiffusionWorker_SP7 pid=1119)     blockwise = bool(component.stacks) and enable_encoder_blocks(component)
(DiffusionWorker_SP7 pid=1119)                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 1497, in _try_layerwise_offload_encoder
(DiffusionWorker_SP7 pid=1119)     encoder_hooks.extend(self._install_hook_group(blocks, TEXT_ENCODER_COMPONENT))
(DiffusionWorker_SP7 pid=1119)                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 1456, in _install_hook_group
(DiffusionWorker_SP7 pid=1119)     apply_distributed_block_hook(
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 766, in apply_distributed_block_hook
(DiffusionWorker_SP7 pid=1119)     registry.register_hook(DistributedLayerwiseOffloadHook._HOOK_NAME, hook)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/hooks/base.py", line 152, in wrappe
r
(DiffusionWorker_SP7 pid=1119)     res = func(self, *args, **kwargs)
(DiffusionWorker_SP7 pid=1119)           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/hooks/base.py", line 235, in regist
er_hook
(DiffusionWorker_SP7 pid=1119)     hook.initialize_hook(self.module)
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 252, in initialize_hook
(DiffusionWorker_SP7 pid=1119)     self.cpu_shards, self.metadata = self._shard_and_pin(
(DiffusionWorker_SP7 pid=1119)                                      ^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119)   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/offloader/distributed_layerwise_bac
kend.py", line 383, in _shard_and_pin
(DiffusionWorker_SP7 pid=1119)     shard = torch.zeros(
(DiffusionWorker_SP7 pid=1119)             ^^^^^^^^^^^^
(DiffusionWorker_SP7 pid=1119) torch.OutOfMemoryError: allocate_host_memory_slowpath:../torch_npu/csrc/core/npu/CachingHostAllocator.cpp:252 NPU function error: aclrtMallocHostWithCfg, error code is 207001
(DiffusionWorker_SP7 pid=1119) [ERROR] 2026-10-10-01:49:39 (PID:1119, Device:7, RankID:7) ERR00100 PTA call acl api failed
(DiffusionWorker_SP7 pid=1119) [Error]: Failed to apply for memory.
(DiffusionWorker_SP7 pid=1119)         Check the remaining storage space in the hardware environment.
(DiffusionWorker_SP7 pid=1119) [PID: 1119] 2026-10-10-01:49:39.813.031 Resource_Error_Insufficient_Host_Memory(EL0018): Failed to allocate 134217728 bytes host memory requested by the RUNTIME module.
(DiffusionWorker_SP7 pid=1119)         Possible Cause: Allocation failed due to insufficient host memory.
(DiffusionWorker_SP7 pid=1119)         Solution: Ensure that the required memory is available. Take measures such as stopping unnecessary processes to free memory.
(DiffusionWorker_SP7 pid=1119) TraceBack (most recent call last):
(DiffusionWorker_SP7 pid=1119)         Failed to allocate memory requested by RUNTIME module.
(DiffusionWorker_SP7 pid=1119)         rtsMallocHost execution failed, reason=driver error:out of memory[FUNC:FuncErrorReason][FILE:error_message_manage.cc][LINE:69]
```

### Tried vllm-omni v0.31.0rc1, SAME
