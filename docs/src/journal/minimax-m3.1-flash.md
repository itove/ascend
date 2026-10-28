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
