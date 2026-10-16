### Change vllm-omni to v0.31.0rc1, not patched yet, and got 
```
/vllm-workspace/vllm-omni/vllm_omni/version.py:55: RuntimeWarning: vLLM and vLLM-Omni appear to have mismatched major/minor versions:
 --> vLLM-Omni version 0.1.dev1+g32ead8e5c.cpu
 --> vLLM version 0.31.0
This will likely cause compatibility issues.
  warn_if_misaligned_vllm_version()
2026-10-16 09:16:53,731 - 233 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.31.0+empty: default 1
Failed to import the DeepSelect extension (vllm._deepselect_C): No module named 'vllm._deepselect_C'
(MainProcess pid=233) INFO 10-16 09:16:54 [serve.py:314] Detected diffusion model: /s/hf/Qwen/Qwen-Image-2.1/
(MainProcess pid=233) INFO 10-16 09:16:54 [logo.py:52]        █     █     █▄   ▄█       ▄▀▀▀▀▄ █▄   ▄█ █▄    █ ▀█▀
(MainProcess pid=233) INFO 10-16 09:16:54 [logo.py:52]  ▄▄ ▄█ █     █     █ ▀▄▀ █  ▄▄▄  █    █ █ ▀▄▀ █ █ ▀▄  █  █
(MainProcess pid=233) INFO 10-16 09:16:54 [logo.py:52]   █▄█▀ █     █     █     █       █    █ █     █ █   ▀▄█  █
(MainProcess pid=233) INFO 10-16 09:16:54 [logo.py:52]    ▀▀  ▀▀▀▀▀ ▀▀▀▀▀ ▀     ▀        ▀▀▀▀  ▀     ▀ ▀     ▀ ▀▀▀
(MainProcess pid=233) INFO 10-16 09:16:54 [logo.py:52]
(APIServer pid=233) INFO 10-16 09:16:54 [api_utils.py:347] vLLM server version 0.31.0, serving model /s/hf/Qwen/Qwen-Image-2.1/
(APIServer pid=233) INFO 10-16 09:16:54 [api_utils.py:286] non-default args: {'model_tag': '/s/hf/Qwen/Qwen-Image-2.1/', 'port': 8091, 'model': '/s/hf/Qwen/Qwen-Image-2.1/', 'trust_remote_code': True, 'gpu_memory_utilization': 0.9}
(APIServer pid=233) INFO 10-16 09:16:54 [omni_base.py:208] [AsyncOmni] Initializing with model /s/hf/Qwen/Qwen-Image-2.1/
(APIServer pid=233) INFO 10-16 09:16:54 [omni_engine_base.py:163] [OmniEngine] Initializing with model /s/hf/Qwen/Qwen-Image-2.1/
(APIServer pid=233) WARNING 10-16 09:16:54 [warnings.py:112] /vllm-workspace/vllm-omni/vllm_omni/config/omni_config.py:1390: FutureWarning: Diffusion config field 'diffusion_attention_backend' is deprecated; use 'diffusion_attention_config'.
(APIServer pid=233) WARNING 10-16 09:16:54 [ring_globals.py:97] FlashInfer ring kernels are unavailable. Reason: No module named 'flashinfer'
(APIServer pid=233) INFO 10-16 09:16:55 [config_factory.py:697] Resolved generic diffusion final_output_type='image' for model_class_name='QwenImage21Pipeline'.
(APIServer pid=233) INFO 10-16 09:16:55 [omni_engine_base.py:312] [OmniEngine] Launching Orchestrator thread with 1 stages
(APIServer pid=233) INFO 10-16 09:16:55 [stage_utils.py:178] Stage 0 logical-to-physical device mapping: 0->0
(APIServer pid=233) INFO 10-16 09:16:56 [kernel.py:408] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(APIServer pid=233) WARNING 10-16 09:16:56 [platform.py:482] Model config is missing. Skipping Ascend-specific config updates.
(APIServer pid=233) INFO 10-16 09:16:56 [compilation.py:331] Enabled custom fusions: norm_quant, act_quant
(APIServer pid=233) INFO 10-16 09:16:56 [diffusion_worker.py:349] Final IR op priority after setting vLLM-Omni overrides: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(APIServer pid=233) WARNING 10-16 09:16:58 [patch_triton.py:332] NPU Triton causal_conv1d_update is unavailable (cannot import name 'causal_conv1d_update_npu' from 'vllm_ascend.ops.triton.mamba.causal_conv1d' (/vllm-workspace/vllm-ascend/vllm_ascend/ops/triton/mamba/causal_conv1d.py)); falling back to the PyTorch implementation, which syncs per request and therefore stalls ACL graph capture at decode-FULL.
(APIServer pid=233) INFO 10-16 09:16:58 [ascend_config.py:334] Dynamic EPLB is False
(APIServer pid=233) INFO 10-16 09:16:58 [ascend_config.py:335] The number of redundant experts is 0
(APIServer pid=233) INFO 10-16 09:16:58 [ascend_config.py:739] FlashComm1 is disabled. Using flashinfer_all2allv as the all2all backend.
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
(APIServer pid=233) INFO 10-16 09:16:58 [diffusion_worker.py:366] Worker 0: Initialized device and distributed environment.
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
(APIServer pid=233) INFO 10-16 09:16:58 [parallel_state.py:610] Building SP subgroups from explicit sp_group_ranks (sp_size=1, ulysses=1, ring=1, use_ulysses_low=True).
(APIServer pid=233) INFO 10-16 09:16:58 [parallel_state.py:652] SP group details for rank 0: sp_group=[0], ulysses_group=[0], ring_group=[0]
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
[Gloo] Rank 0 is connected to 0 peer ranks. Expected number of connected peer ranks is : 0
(DiffusionWorker pid=233) INFO 10-16 09:16:59 [pipeline_diffusers_adapter.py:194] Loading Diffusers pipeline class DiffusionPipeline
(DiffusionWorker pid=233) WARNING 10-16 09:16:59 [warnings.py:112] /usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/deprecation_utils.py:23: FutureWarning: `torch_dtype` is deprecated and will be removed in version 1.0.0. Please use `dtype` instead.
Loading weights: 100%|█████████████████████████████████████████████████████████████| 750/750 [00:00<00:00, 4145.25it/s]
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 2/2 [00:00<00:00, 40.45it/s]
Loading pipeline components...: 100%|████████████████████████████████████████████████████| 5/5 [00:02<00:00,  1.98it/s]
[rank0]:[W1016 09:17:02.857657045 NPUCachingAllocator.cpp:202] Warning: The current CANN and HDK(driver) versions require processing for 32 padding size, with memory allocation. (function operator())
Attention backends are an experimental feature and the API may be subject to change.
(DiffusionWorker pid=233) INFO 10-16 09:17:09 [pipeline_diffusers_adapter.py:428] Set diffusers attention backend to 'native', adapted from user config value 'TORCH_SDPA'.
(DiffusionWorker pid=233) INFO 10-16 09:17:10 [diffusion_model_runner.py:363] Model loading took 30.2292 GiB and 12.077749 seconds
(DiffusionWorker pid=233) INFO 10-16 09:17:10 [diffusion_model_runner.py:369] Model runner: Model loaded successfully.
(DiffusionWorker pid=233) WARNING 10-16 09:17:10 [diffusion_model_runner.py:413] Model runner: Platform npu does not support torch inductor, skipping torch.compile.
(DiffusionWorker pid=233) INFO 10-16 09:17:10 [diffusion_model_runner.py:460] Model runner: Initialization complete.
(DiffusionWorker pid=233) WARNING 10-16 09:17:11 [gpu_memory_utils.py:88] NVML init failed, will use profiling fallback: NVML Shared Library Not Found
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [manager.py:118] Initializing DiffusionLoRAManager: device=npu:0, dtype=torch.bfloat16, max_cached_adapters=1, static_lora_path=None
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [diffusion_worker.py:318] Worker 0: Initialization complete.
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [uniproc_executor.py:74] Diffusion worker initialized in-process (uniproc executor)
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [diffusion_engine.py:434] [RequestBatch] engine init max_num_seqs=1 max_wait_ms=0.0
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [diffusion_engine.py:1428] dummy run to warm up the model
(DiffusionWorker pid=233) INFO 10-16 09:17:11 [pipeline_diffusers_adapter.py:500] Calling diffusers pipeline with kwargs: {'prompt': 'dummy run', 'image': {'type': 'Image', 'size': (512, 512)}, 'generator': 'Generator with seed 703081991 on device npu:0', 'height': 512, 'width': 512, 'num_inference_steps': 2, 'output_type': 'pil', 'num_images_per_prompt': 1}
[W1016 09:17:18.653744496 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
(DiffusionWorker pid=233) WARNING 10-16 09:17:27 [warnings.py:112] /usr/local/Ascend/cann-9.1.0/opp/built-in/op_impl/ai_core/tbe/impl/ops_legacy/dynamic/gelu_grad_v2.py:97: SyntaxWarning: invalid escape sequence '\h'
(DiffusionWorker pid=233) WARNING 10-16 09:17:27 [warnings.py:112] /usr/local/Ascend/cann-9.1.0/opp/built-in/op_impl/ai_core/tbe/impl/ops_legacy/dynamic/gelu_grad_v2.py:157: SyntaxWarning: invalid escape sequence '\h'
  0%|                                                                                            | 0/2 [00:00<?, ?it/s]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] Error executing method 'execute_model'. This might cause issues in distributed execution.
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] Traceback (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1886, in execute_method
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return func(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 704, in execute_model
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     output = self.model_runner.execute_model(req, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_model_runner.py", line 968, in execute_model
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     runner_output = self._execute_request_list(
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_model_runner.py", line 876, in _execute_request_list
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     raw_outputs = self.pipeline.forward(batch)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/models/diffusers_adapter/pipeline_diffusers_adapter.py", line 235, in forward
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     output = self._pipeline(**kwargs)  # pyright: ignore[reportCallIssue]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]              ^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/utils/_contextlib.py", line 124, in decorate_context
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return func(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/pipelines/qwenimage21/pipeline_qwenimage21.py", line 772, in __call__
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     noise_pred = self.transformer(
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]                  ^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return self._call_impl(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return forward_call(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/utils/peft_utils.py", line 323, in wrapper
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     result = forward_fn(self, *args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/transformer_qwenimage21.py", line 925, in forward
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     rotary_emb = self.pos_embed(img_shapes[0], image_pad_mask, device=hidden_states.device)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1776, in _wrapped_call_impl
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return self._call_impl(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch/nn/modules/module.py", line 1787, in _call_impl
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return forward_call(*args, **kwargs)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/diffusers/models/transformers/transformer_qwenimage21.py", line 710, in forward
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]     return torch.cat([self.freqs[0][frame_index], self.freqs[1][height_index], self.freqs[2][width_index]], dim=-1)
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]                       ~~~~~~~~~~~~~^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] RuntimeError: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890] TraceBack (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]         Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_worker.py:1890]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299] Dummy run failed: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299] [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299] [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299] TraceBack (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]         Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:48 [diffusion_engine.py:1299]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] [StageRuntime] Stage initialization failed; shutting down 0 initialized client(s)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] Traceback (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 297, in initialize
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     initialized_clients = self._initialize_stage_replicas(stage_plans, self._stage_init_timeout)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 946, in _initialize_stage_replicas
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     raise primary_exc
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 907, in _init_group
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     client = self._initialize_replica(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]              ^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1136, in _initialize_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1257, in _initialize_local_diffusion_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     client, resources = launch_diffusion_stage_replica(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     client = initialize_diffusion_stage(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2045, in initialize_diffusion_stage
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09::50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     return InlineStageDiffusionClient(model, od_config, metadata)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     self._engine = DiffusionEngine.make_engine(self.od_config)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1086, in make_engine
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     engine.run_startup_warmup()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1297, in run_startup_warmup
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     self._dummy_run()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1431, in _dummy_run
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]     raise RuntimeError(f"Dummy run failed: {output.error}")
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] RuntimeError: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310] TraceBack (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]         Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [stage_runtime.py:310]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] [OmniEngine] Orchestrator thread crashed
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] Traceback (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 472, in _bootstrap_orchestrator
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     loop.run_until_complete(_run_orchestrator())
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 691, in run_until_complete
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     return future.result()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 445, in _run_orchestrator
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     self._initialize_stages(stage_init_timeout)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 392, in _initialize_stages
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     self._runtime.initialize()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 316, in initialize
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     raise exc
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 297, in initialize
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     initialized_clients = self._initialize_stage_replicas(stage_plans, self._stage_init_timeout)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 946, in _initialize_stage_replicas
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     raise primary_exc
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 907, in _init_group
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     client = self._initialize_replica(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]              ^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1136, in _initialize_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1257, in _initialize_local_diffusion_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     client, resources = launch_diffusion_stage_replica(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 160 in launch_diffusion_stage_replica
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     client = initialize_diffusion_stage(
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2045, in initialize_diffusion_stage
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     return InlineStageDiffusionClient(model, od_config, metadata)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     self._engine = DiffusionEngine.make_engine(self.od_config)
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1086, in make_engine
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     engine.run_startup_warmup()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1297, in run_startup_warmup
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     self._dummy_run()
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1431, in _dummy_run
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]     raise RuntimeError(f"Dummy run failed: {output.error}")
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] RuntimeError: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478] TraceBack (most recent call last):
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data typeFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]         Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
(DiffusionWorker pid=233) ERROR 10-16 09:17:50 [omni_engine_base.py:478]
(DiffusionWorker pid=233) INFO 10-16 09:17:50 [omni_engine_base.py:1151] [OmniEngine] Shutting down Orchestrator
Exception in thread orchestrator:
Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1075, in _bootstrap_inner
    self.run()
  File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1012, in run
    self._target(*self._args, **self._kwargs)
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 472, in _bootstrap_orchestrator
    loop.run_until_complete(_run_orchestrator())
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 691, in run_until_complete
    return future.result()
           ^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 445, in _run_orchestrator
    self._initialize_stages(stage_init_timeout)
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 392, in _initialize_stages
    self._runtime.initialize()
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 316, in initialize
    raise exc
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 297, in initialize
    initialized_clients = self._initialize_stage_replicas(stage_plans, self._stage_init_timeout)
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 946, in _initialize_stage_replicas
    raise primary_exc
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 907, in _init_group
    client = self._initialize_replica(
             ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1136, in _initialize_replica
    return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1257, in _initialize_local_diffusion_replica
    iffusion_stage_replica(
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
    client = initialize_diffusion_stage(
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2045, in initialize_diffusion_stage
    return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
    return InlineStageDiffusionClient(model, od_config, metadata)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
    self._engine = DiffusionEngine.make_engine(self.od_config)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1086, in make_engine
    engine.run_startup_warmup()
  File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1297, in run_startup_warmup
    self._dummy_run()
  File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1431, in _dummy_run
    raise RuntimeError(f"Dummy run failed: {output.error}")
RuntimeError: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
[ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
[PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
TraceBack (most recent call last):
        [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
        [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
        [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
        [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
        [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
        Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].

[rank0]: Traceback (most recent call last):
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1075, in _bootstrap_inner
[rank0]:     self.run()
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/threading.py", line 1012, in run
[rank0]:     self._target(*self._args, **self._kwargs)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/enginin _bootstrap_orchestrator
[rank0]:     loop.run_until_complete(_run_orchestrator())
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 691, in run_until_complete
[rank0]:     return future.result()
[rank0]:            ^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 445, in _run_orchestrator
[rank0]:     self._initialize_stages(stage_init_timeout)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 392, in _initialize_stages
[rank0]:     self._runtime.initialize()
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 316, in initialize
[rank0]:     raise exc
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 297, in initialize
[rank0]:     initialized_clients = self._initialize_stage_replicas(stage_plans, self._stage_init_timeout)
[rank0]:                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 946, in _initialize_stage_replicas
[rank0]:     raise primary_exc
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 907, in _init_group
[rank0]:     client = self._initialize_replica(
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1136, in _initialize_replica
[rank0]:     return self._initialize_local_diffusion_replica(plan, stage_init_timeout)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_runtime.py", line 1257, in _initialize_local_diffusion_replica
[rank0]:     client, resources = launch_diffusion_stage_replica(
[rank0]:                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
[rank0]:     client = initialize_diffusion_stage(
[rank0]:              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/stage_init_utils.py", line 2045, in initialize_diffusion_stage
[rank0]:     return create_diffusion_client(model, od_config, metadata, stage_init_timeout, use_inline)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/stage_diffusion_client.py", line 58, in create_diffusion_client
[rank0]:     return InlineStageDiffusionClient(model, od_config, metadata)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
[rank0]:     self._engine = DiffusionEngine.make_engine(self.od_config)
[rank0]:                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1086, in make_engine
[rank0]:     engine.run_startup_warmup()
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1297, in run_startup_warmup
[rank0]:     self._dummy_run()
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1431, in _dummy_run
[rank0]:     raise RuntimeError(f"Dummy run failed: {output.error}")
[rank0]: RuntimeError: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
[rank0]: [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
[rank0]: [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
[rank0]: TraceBack (most :
[rank0]:         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
[rank0]:         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
[rank0]:         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
[rank0]:         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
[rank0]:         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
[rank0]:         Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].


[rank0]: The above exception was the direct cause of the following exception:

[rank0]: Traceback (most recent call last):
[rank0]:   File "/usr/local/python3.12.13/bin/vllm", line 6, in <module>
[rank0]:     sys.exit(main())
[rank0]:              ^^^^^^
[rank0]:   File "/vllm-workspace/vllm/vllm/entrypoints/cli/main.py", line 40, in main
[rank0]:     if maybe_run_omni():
[rank0]:        ^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm/vllm/entrypoints/cli/main.py", line 34, in maybe_run_omni
[rank0]:     omni_main()
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/cli/main.py", line 77, in main
[rank0]:     args.dispatch_function(args)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/cli/serve.py", line 160, in cmd
[rank0]:     uvloop.run(omni_run_server(args))
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/uvloop/__init__.py", line 96, in run
[rank0]:     return __asyncio.run(
[rank0]:            ^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 195, in run
[rank0]:     return runner.run(main)
[rank0]:            ^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 118, in run
[rank0]:     return self._loop.run_until_complete(task)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "uvloop/loop.pyx", line 1515, in uvloop.loop.Loop.run_until_complete
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/site-packages/uvloop/__init__.py", line 48, in wrapper
[rank0]:     return await main
[rank0]:            ^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/openai/api_server.py", line 248, in omni_run_server
[rank0]:     await omni_run_server_worker(listen_address, sock, args, **uvicorn_kwargs)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/openai/api_server.py", line 350, in omni_run_server_worker
[rank0]:     async with build_async_omni(
[rank0]:                ^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/contextlib.py", line 210, in __aenter__
[rank0]:     return await anext(self.gen)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/openai/api_server.py", line 540, in build_async_omni
[rank0]:     async with build_async_omni_from_   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/contextlib.py", line 210, in __aenter__
[rank0]:     return await anext(self.gen)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/openai/api_server.py", line 647, in build_async_omni_from_stage_config
[rank0]:     async_omni = AsyncOmni(model=model, **kwargs)
[rank0]:                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/async_omni.py", line 89, in __init__
[rank0]:     AsyncOmniBase.__init__(self, *args, model=model, **kwargs)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/async_omni_base.py", line 110, in __init__
[rank0]:     OmniBase.__init__(self, model=model, **kwargs)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/omni_base.py", line 215, in __init__
[rank0]:     self.engine = self._create_engine(
[rank0]:                   ^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/entrypoints/async_omni.py", line 85, in _create_engine
[rank0]:     return AsyncOmniEngine(**engine_kwargs)
[rank0]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 327, in __init__
[rank0]:     self._wait_for_orchestrator_init(startup_future, startup_timeout)
[rank0]:   File "/vllm-workspace/vllm-omni/vllm_omni/engine/omni_engine_base.py", line 530, in _wait_for_orchestrator_init
[rank0]:     startup_future.result(
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/_base.py", line 456, in result
[rank0]:     return self.__get_result()
[rank0]:            ^^^^^^^^^^^^^^^^^^^
[rank0]:   File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/_base.py", line 401, in __get_result
[rank0]:     raise self._exception
[rank0]: RuntimeError: Orchestrator initialization failed: Dummy run failed: index_high_dims_op_api:../third_party/op-plugin/op_plugin/ops/opapi/IndexKernelNpuOpApi.cpp:40 NPU function error: call aclnnIndex failed, error code is 161002
[rank0]: [ERROR] 2026-10-16-09:17:48 (PID:233, Device:0, RankID:0) ERR00100 PTA call acl api failed.
[rank0]: [PID: 233] 2026-10-16-09:17:48.238.457 AclNN_Parameter_Error(EZ1001): Tensor self not implemented for DT_COMPLEX64, should be in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
[rank0]: TraceBack (most recent call last):
[rank0]:         [InitOpInfoLib][InitOpKernel] Inconsistent format size [1] and data type size [3]![FUNC:InitUnknownFormatAndDtype][FILE:op_kernel_info_constructor.cc][LINE:960]
[rank0]:         [InitOpInfoLib][InitOpKernel] Node[CausalConv1dBwd]: failed to initialize unknown shape dtype and format. The input or output is input6.queryStartLoc.[FUNC:InitFormatAndDtypeForSingleInputAndOutput][FILE:op_kernel_info_constructor.cc][LINE:556]
[rank0]:         [InitOpInfoLib][InitOpKernel] Initialization of Op CausalConv1dBwd with input_desc_info input6 failed.[FUNC:ParseInputAndOutputFromOpContent][FILE:op_kernel_info_constructor.cc][LINE:486]
[rank0]:         [InitOpInfoLib][InitOpKernel] Failed to initialize inputs and outputs for Op CausalConv1dBwd.[FUNC:InitializeOpKernelInfo][FILE:op_kernel_info_constructor.cc][LINE:226]
[rank0]:         [GraphOpt][Init][ConstructOpKernelInfo] OpKernelInfo CausalConv1dBwd initialization failed.[FUNC:ConstructOpKernelInfo][FILE:sub_op_info_store.cc][LINE:196]
[rank0]:         Tensor self not imple in dtype support list [DT_FLOAT,DT_FLOAT16,DT_INT64,DT_INT32,DT_BOOL,DT_INT8,DT_UINT8,DT_BFLOAT16,DT_DOUBLE,DT_INT16,].
```
