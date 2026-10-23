### docker run

```
CONTAINER_NAME=deepseek-v4.1-flash_1017 DOCKER_IMAGE_TAG=v0.30.0rc2 ./docker-run.sh
```



### serve
```
MODEL_PATH=/s/modelscope/Eco-Tech/DeepSeek-V4.1-Flash-1017-w8a8/ /s/ascend/vllm/bin/serve-deepseek-v4.1-flash-1017-w8a8.sh
```


```
set -e

. /s/ascend/vllm/ENVs

export VLLM_USE_V2_MODEL_RUNNER=0
export VLLM_ENGINE_READY_TIMEOUT_S=36000
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export HCCL_BUFFSIZE=1024
export HCCL_OP_EXPANSION_MODE="AIV"

export OMP_PROC_BIND=false
export OMP_NUM_THREADS=10

    # --async-scheduling \
        # "enable_shared_expert_dp":true,
vllm serve "$MODEL_PATH" \
    --host 0.0.0.0 \
    --port 8900 \
    --max-model-len 150000 \
    --max-num-batched-tokens 8192 \
    --served-model-name "$MODEL_NAME" \
    --gpu-memory-utilization 0.9 \
    --max-num-seqs 32 \
    --data-parallel-size 1 \
    --tensor-parallel-size 8 \
    --enable-expert-parallel \
    --tokenizer-mode deepseek_v41 \
    --reasoning-parser deepseek_v41 \
    --tool-call-parser deepseek_v41 \
    --enable-auto-tool-choice \
    --safetensors-load-strategy lazy \
    --model-loader-extra-config='{"enable_multithread_load": true, "num_threads": 128}' \
    --quantization ascend \
    --block-size 128 \
    --speculative-config '{"num_speculative_tokens": 7,"method": "dspark","draft_sample_method":"greedy","enforce_eager": true}' \
    --compilation-config '{"cudagraph_mode":"FULL_DECODE_ONLY"}' \
    --additional-config '{
        "ascend_compilation_config":{
            "enable_npugraph_ex":true,
            "enable_static_kernel":false
        },
        "enable_cpu_binding":true,
        "enable_dsa_cp":true,
        "enable_flashcomm1":true,
        "multistream_overlap_shared_expert": true
    }'
```




```
error

(APIServer pid=171) Traceback (most recent call last):
(APIServer pid=171)   File "/usr/local/python3.12.13/bin/vllm", line 6, in <module>
(APIServer pid=171)     sys.exit(main())
(APIServer pid=171)              ^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/cli/main.py", line 106, in main
(APIServer pid=171)     args.dispatch_function(args)
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/cli/serve.py", line 154, in cmd
(APIServer pid=171)     uvloop.run(run_server(args))
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/site-packages/uvloop/__init__.py", line 96, in run
(APIServer pid=171)     return __asyncio.run(
(APIServer pid=171)            ^^^^^^^^^^^^^^
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 195, in run
(APIServer pid=171)     return runner.run(main)
(APIServer pid=171)            ^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 118, in run
(APIServer pid=171)     return self._loop.run_until_complete(task)
(APIServer pid=171)            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "uvloop/loop.pyx", line 1515, in uvloop.loop.Loop.run_until_complete
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/site-packages/uvloop/__init__.py", line 48, in wrapper
(APIServer pid=171)     return await main
(APIServer pid=171)            ^^^^^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/launchers/api_server/entry.py", line 176, in run_server
(APIServer pid=171)     await run_server_worker(listen_address, sock, args, **uvicorn_kwargs)
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/launchers/api_server/entry.py", line 190, in run_server_worker
(APIServer pid=171)     async with build_async_engine_client(
(APIServer pid=171)                ^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/contextlib.py", line 210, in __aenter__
(APIServer pid=171)     return await anext(self.gen)
(APIServer pid=171)            ^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/launchers/api_server/entry.py", line 58, in build_async_engine_client
(APIServer pid=171)     async with build_async_engine_client_from_engine_args(
(APIServer pid=171)                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/contextlib.py", line 210, in __aenter__
(APIServer pid=171)     return await anext(self.gen)
(APIServer pid=171)            ^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/entrypoints/launchers/api_server/entry.py", line 82, in build_async_engine_client_from_engine_args
(APIServer pid=171)     vllm_config = engine_args.create_engine_config(usage_context=usage_context)
(APIServer pid=171)                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/engine/arg_utils.py", line 2406, in create_engine_config
(APIServer pid=171)     speculative_config = self.create_speculative_config(
(APIServer pid=171)                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/vllm-workspace/vllm/vllm/engine/arg_utils.py", line 1964, in create_speculative_config
(APIServer pid=171)     return SpeculativeConfig(**self.speculative_config)
(APIServer pid=171)            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(APIServer pid=171)   File "/usr/local/python3.12.13/lib/python3.12/site-packages/pydantic/_internal/_dataclasses.py", line 121, in __init__
(APIServer pid=171)     s.__pydantic_validator__.validate_python(ArgsKwargs(args, kwargs), self_instance=s)
(APIServer pid=171) pydantic_core._pydantic_core.ValidationError: 1 validation error for SpeculativeConfig
(APIServer pid=171)   Value error, num_speculative_tokens:7 must be divisible by n_predict=5 [type=value_error, input_value=ArgsKwargs((), {'num_spec...very_timeout_sec=120))}), input_type=ArgsKwargs]
(APIServer pid=171)     For further information visit https://errors.pydantic.dev/2.14/v/value_error
(APIServer pid=171) [ERROR] 2026-10-23-03:21:29 (PID:171, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```
