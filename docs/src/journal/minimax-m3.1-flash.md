### docker run 


```
CONTAINER_NAME=minimax-m3.1 DOCKER_IMAGE_TAG=v0.30.0rc2 ./docker-run.sh

```


### server

```
MODEL_PATH=/s/modelscope/Eco-Tech/MiniMax-M3.1-Flash-w8a8/ /s/ascend/vllm/bin/serve-deepseek-v4.1-flash-1017-w8a8.sh
```

### error

```
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/model_executor/model_loader/utils.py", line 59, in initialize_model
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     model = model_class(vllm_config=vllm_config, prefix=prefix)
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/compilation/decorators.py", line 385, in __init__
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     old_init(self, *args, **kwargs)
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm-ascend/vllm_ascend/models/deepseek_v4/dspark.py", line 344, in __init__
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     self.model = DeepseekV4DSparkModel(
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]                  ^^^^^^^^^^^^^^^^^^^^^^
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm-ascend/vllm_ascend/models/deepseek_v4/dspark.py", line 82, in __init__
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     self.hc_mult = config.hc_mult
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]                    ^^^^^^^^^^^^^^
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/transformers/configuration_utils.py", line 464, in __getattribute__
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     return super().__getattribute__(key)
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/transformers/integrations/heterogeneity/configuration_utils.py", line 280, in __getattribute__
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]     return super().__getattribute__(key)
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(Worker_TP1_EP1 pid=645) ERROR 10-28 00:51:25 [multiproc_executor.py:944] AttributeError: 'MiniMaxM3TextConfig' object has no attribute 'hc_mult'
(Worker_TP0_EP0 pid=611) INFO 10-28 00:51:25 [platform.py:1455] Set PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
(Worker_TP0_EP0 pid=611) INFO 10-28 00:51:25 [compilation.py:336] Enabled custom fusions: norm_quant, act_quant
(Worker_TP0_EP0 pid=611) INFO 10-28 00:51:25 [llm_base_proposer.py:357] [spec_decode/base] Loading draft model: method=dspark, load_format=None, model=/s/modelscope/Eco-Tech/MiniMax-M3.1-Flash-w8a8/
(Worker_TP4_EP4 pid=1084) INFO 10-28 00:51:26 [model_runner_v1.py:4422] Loading drafter model...
(Worker_TP4_EP4 pid=1084) INFO 10-28 00:51:26 [kernel.py:416] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['native'], fused_add_rms_norm=['native'], gelu_and_mul_sparse=['native'])
(Worker_TP4_EP4 pid=1084) WARNING 10-28 00:51:26 [platform.py:730] GPU-specific parameter is not supported on Ascend. parameter=disable_cascade_attn, value=True, action: resetting to False.
```


### docker run 


```
CONTAINER_NAME=minimax-m3.1 DOCKER_IMAGE_TAG=minimax-m3.1-flash  ./docker-run.sh
```


### server

```
MODEL_PATH=/s/modelscope/Eco-Tech/MiniMax-M3.1-Flash-w8a8/ ./serve-minimax-m2.7-w8a8.sh
```

```
set -e

. /s/ascend/vllm/ENVs
export MODEL_PATH=$MODEL_PATH
export MAX_MODEL_LEN=133000
export VLLM_ASCEND_USE_CUDAGRAPH=0

export VLLM_USE_V2_MODEL_RUNNER=1
export HCCL_BUFFSIZE=1024
export HCCL_OP_EXPANSION_MODE="AIV"
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True

vllm serve ${MODEL_PATH} \
        --host 0.0.0.0 \
        --port 11223 \
        --served-model-name minimax-m3.1-flash \
        --trust-remote-code \
        --max-model-len "$MAX_MODEL_LEN" \
        --tensor-parallel-size 4 \
        --data-parallel-size 4 \
        --max-num-seqs 32 \
        --disable-hybrid-kv-cache-manager \
        --gpu-memory-utilization 0.92 \
        --quantization ascend \
        --reasoning-parser minimax_m3 \
        --enable-auto-tool-choice \
        --tool-call-parser minimax_m3 \
        --limit-mm-per-prompt '{"image":1,"video":0}' \
        --enable-chunked-prefill \
        --enable-prefix-caching \
        --additional-config '{
        "enable_cpu_binding": true,
        "enable_flashcomm1": true,
        "multistream_overlap_shared_expert": true,
        "enable_shared_expert_dp":true,
        "weight_nz_mode": 2
}' \
        --speculative-config '{
        "method":"dspark",
        "num_speculative_tokens":7,
        "enforce_eager":true,
        "draft_sample_method":"probabilistic"
}' \
        --safetensors-load-strategy prefetch
```

### error

```
WARNING 10-28 09:11:25 [ascend_config.py:770] FlashComm1 is enabled, but the current config does not support sp MoE. Disabling
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944] WorkerProc failed to start.
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944] Traceback (most recent call last):
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/v1/executor/multiproc_executor.py", line 911, in worker_main
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     worker = WorkerProc(*args, **kwargs)
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/tracing/otel.py", line 178, in sync_wrapper
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     return func(*args, **kwargs)
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]            ^^^^^^^^^^^^^^^^^^^^^
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/v1/executor/multiproc_executor.py", line 672, in __init__
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     self.worker.init_device()
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm/vllm/v1/worker/worker_base.py", line 355, in init_device
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     self.worker.init_device()  # type: ignore
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     ^^^^^^^^^^^^^^^^^^^^^^^^^
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm-ascend/vllm_ascend/worker/worker.py", line 495, in init_device
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     self.device = self._init_device()
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]                   ^^^^^^^^^^^^^^^^^^^
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/vllm-workspace/vllm-ascend/vllm_ascend/worker/worker.py", line 433, in _init_device
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     torch.npu.set_device(device)
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]   File "/usr/local/python3.12.13/lib/python3.12/site-packages/torch_npu/npu/utils.py", line 94, in set_device
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]     torch_npu._C._npu_setDevice(device_id)
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944] RuntimeError: ExchangeDevice:../torch_npu/csrc/core/npu/sys_ctrl/npu_sys_ctrl.cpp:318 NPU function error: c10_npu::SetDevice(device), error code is 107001
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944] [ERROR] 2026-10-28-09:11:25 (PID:11651, Device:0, RankID:-1) ERR00100 PTA call acl api failed
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944] [Error]: Invalid device ID.
(Worker pid=11651) ERROR 10-28 09:11:25 [multiproc_executor.py:944]         Check whether the device ID is valid.



```

