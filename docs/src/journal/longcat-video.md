[LongCat-Video Ascend NPU 适配文档](https://ai.gitcode.com/JeffDing/LongCat-Video-Ascend-model)
[在昇腾NPU上跑通了LongCat-Video图像编辑模型的部署经验记录](https://gitcode.com/Ascend/MindSpeed-LLM/issues/1036)

```
SHM_SIZE=256 CONTAINER_NAME=longcat-video DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.30.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```
### error
```
(APIServer pid=81) ERROR 10-19 09:01:20 [repo_utils.py:119] Error parsing config for /s/hf/meituan-longcat/LongCat-Video
/: Unrecognized model in /s/hf/meituan-longcat/LongCat-Video/. Should have a `model_type` key in its config.json., retry
ing 1 of 2
(APIServer pid=81) ERROR 10-19 09:01:22 [repo_utils.py:117] Error parsing config for /s/hf/meituan-longcat/LongCat-Video
/: Unrecognized model in /s/hf/meituan-longcat/LongCat-Video/. Should have a `model_type` key in its config.json.
```

```
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308] [StageRuntime] Stage initialization failed; shuttin
g down 0 initialized client(s)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308] Traceback (most recent call last):
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_runtime.py", line 295, in initialize
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     initialized_clients = self._initialize_stage_re
plicas(stage_plans, self._stage_init_timeout)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                           ^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_runtime.py", line 885, in _initialize_stage_replicas
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     raise primary_exc
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_runtime.py", line 846, in _init_group
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     client = self._initialize_replica(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_runtime.py", line 1075, in _initialize_replica
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     return self._initialize_local_diffusion_replica
(plan, stage_init_timeout)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_runtime.py", line 1196, in _initialize_local_diffusion_replica
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     client, resources = launch_diffusion_stage_repl
ica(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_engine_startup.py", line 1602, in launch_diffusion_stage_replica
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     client = initialize_diffusion_stage(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/engine/
stage_init_utils.py", line 2035, in initialize_diffusion_stage
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     return create_diffusion_client(model, od_config
, metadata, stage_init_timeout, use_inline)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusi
on/stage_diffusion_client.py", line 58, in create_diffusion_client
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     return InlineStageDiffusionClient(model, od_con
fig, metadata)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/inline_stage_diffusion_client.py", line 70, in __init__
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self._engine = DiffusionEngine.make_engine(self.od_config)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 1078, in make_engine
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     engine = engine_class(config, scheduler=scheduler)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 272, in __init__
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self._init_executor(od_config)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/diffusion_engine.py", line 350, in _init_executor
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self.executor = executor_class(od_config)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                     ^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/abstract.py", line 82, in __init__
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self._init_executor()
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/executor/uniproc_executor.py", line 67, in _init_executor
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self.driver_worker = WorkerWrapperBase(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                          ^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 1706, in __init__
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     worker = worker_class(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]              ^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 308, in __init__
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self.load_model(load_format=self.od_config.diffusion_load_format)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_worker.py", line 430, in load_model
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self.model_runner.load_model(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/worker/diffusion_model_runner.py", line 344, in load_model
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     self.pipeline = model_loader.load_model(
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]                     ^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/model_loader/diffusers_loader.py", line 696, in load_model
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     model = self._init_from_load_format(load_format, target_device, custom_pipeline_name, is_hsdp=False)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/model_loader/diffusers_loader.py", line 1218, in _init_from_load_format
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     model = initialize_model(self.od_config)
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]   File "/vllm-workspace/vllm-omni/vllm_omni/diffusion/registry.py", line 503, in initialize_model
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308]     raise ValueError(f"Model class {od_config.model_class_name} not found in diffusion model registry.")
(DiffusionWorker pid=81) ERROR 10-19 09:01:31 [stage_runtime.py:308] ValueError: Model class None not found in diffusion model registry.
```
