```
vllm serve $MODEL_PATH \
    --max-model-len 133120 \
    --max-num-batched-tokens 8192 \
    --served-model-name $MODEL_NAME \
    --gpu-memory-utilization 0.9 \
    --max-num-seqs 32 \
    --data-parallel-size 1 \
    --tensor-parallel-size 8 \
    --enable-expert-parallel \
    --tokenizer-mode deepseek_v4 \
    --tool-call-parser deepseek_v4 \
    --enable-auto-tool-choice \
    --reasoning-parser deepseek_v4 \
    --model-loader-extra-config='{"enable_multithread_load": true, "num_threads": 128}' \
    --quantization ascend \
    --port 8001 \
    --block-size 128 \
    --speculative-config '{"num_speculative_tokens": 7,"method": "dspark","draft_sample_method":"greedy","enforce_eager": true}' \
    --compilation-config '{"cudagraph_mode": "FULL_DECODE_ONLY"}' \
    --additional-config '
    {"ascend_compilation_config":{
        "enable_npugraph_ex":true,
        "enable_static_kernel":false
        },
    "enable_cpu_binding": true,
    "enable_dsa_cp": true,
    "enable_flashcomm1": true,
    "multistream_overlap_shared_expert": true}'
```

```
host=${1:-127.0.0.1}
port=${2:-8001}
model_path=${3:-/s/modelscope/Eco-Tech/DeepSeek-V4-Flash-w8a8-mtp}
model_name=$(basename $model_path)
model_name=${model_name,,}
key="$4"

# see https://docs.vllm.ai/en/latest/cli/bench/serve/
# --ignore-eos
# --random-prefix-len 12000
vllm bench serve \
    --served-model-name $model_name \
    --model $model_path \
    --host $host \
    --port $port \
    --backend openai-chat \
    --endpoint /v1/chat/completions \
    --dataset-name random \
    --num-prompts 1000 \
    --request-rate 5 \
    --max-concurrency 32 \
    --random-input-len 16000 \
    --random-output-len 2048 \
    --num-warmups 10 \
    --header "Authorization=Bearer $key" \
    --save-result \
    --result-dir /s/public/bench/
```

```
root@maas2:/workspace# /s/ascend/vllm/bin/bench.sh http://127.0.0.1:8001 /s/modelscope/Eco-Tech/DeepSeek-V4-Flash-0731-w8a8/
[W923 03:12:56.980107976 FunctionLoader.cpp:48] Warning: LD_PRELOAD detected, FunctionLoader prefers RTLD_DEFAULT for symbol resolution. (function operator())
INFO 09-23 03:13:03 [__init__.py:44] Available plugins for group vllm.platform_plugins:
INFO 09-23 03:13:03 [__init__.py:46] - ascend -> vllm_ascend:register
INFO 09-23 03:13:03 [__init__.py:49] All plugins in this group will be loaded. Set `VLLM_PLUGINS` to control which plugins to load.
INFO 09-23 03:13:03 [__init__.py:238] Platform plugin ascend is activated
INFO 09-23 03:13:03 [platform.py:62] Breakable cudagraph is force disabled on Ascend because DeepSeek V4 PIECEWISE cudagraph is not supported yet.
2026-09-23 03:13:14,343 - 196 - ServiceProfiler - INFO - VLLM_USE_V1 not set, auto-detected via vLLM 0.23.0+empty: default 1
INFO 09-23 03:13:15 [__init__.py:115] Registered model loader `<class 'vllm_ascend.model_loader.netloader.netloader.ModelNetLoaderElastic'>` with load format `netloader`
INFO 09-23 03:13:15 [__init__.py:115] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
Namespace(subparser='bench', bench_type='serve', dispatch_function=<function BenchmarkServingSubcommand.cmd at 0xfffee897c220>, trust_remote_code=False, seed=0, num_prompts=1000, dataset_name='random', no_stream=False, dataset_path=None, no_oversample=False, skip_chat_template=False, enable_multimodal_chat=False, disable_shuffle=False, custom_output_len=256, custom_ensure_client_side_data=False, spec_bench_output_len=256, spec_bench_category=None, sonnet_input_len=550, sonnet_output_len=150, sonnet_prefix_len=200, sharegpt_output_len=None, timed_trace_chunk_hash_size=16, timed_trace_sec_multiplier=1, timed_trace_label_timestamp='timestamp', timed_trace_label_input_length='input_length', timed_trace_label_output_length='output_length', timed_trace_label_hash_ids='hash_ids', blazedit_min_distance=0.0, blazedit_max_distance=1.0, asr_max_audio_len_sec=inf, asr_min_audio_len_sec=0.0, random_input_len=16000, random_output_len=2048, random_range_ratio='0.0', random_prefix_len=0, random_batch_size=1, no_reranker=False, random_mm_base_items_per_request=1, random_mm_num_mm_items_range_ratio=0.0, random_mm_limit_mm_per_prompt={'image': 255, 'video': 1}, random_mm_bucket_config={(256, 256, 1): 0.5, (720, 1280, 1): 0.5, (720, 1280, 16): 0.0}, hf_subset=None, hf_split=None, hf_name=None, hf_output_len=None, prefix_repetition_prefix_len=256, prefix_repetition_suffix_len=256, prefix_repetition_num_prefixes=10, prefix_repetition_output_len=128, speed_bench_dataset_subset='qualitative', speed_bench_output_len=4096, speed_bench_category=None, label=None, backend='openai-chat', base_url='http://127.0.0.1:8001', host='127.0.0.1', port=8000, endpoint='/v1/chat/completions', header=['Authorization=Bearer '], max_concurrency=32, model='/s/modelscope/Eco-Tech/DeepSeek-V4-Flash-0731-w8a8/', input_len=None, output_len=None, tokenizer=None, tokenizer_mode='auto', use_beam_search=False, logprobs=None, request_rate=5.0, burstiness=1.0, disable_tqdm=False, num_warmups=10, profile=False, save_result=True, save_detailed=False, append_result=False, metadata=None, result_dir='/s/public/bench/', result_filename=None, ignore_eos=False, self_timed=None, percentile_metrics=None, metric_percentiles='99', goodput=None, request_id_prefix='bench-3fd248e4-', top_p=None, top_k=None, min_p=None, temperature=None, frequency_penalty=None, presence_penalty=None, repetition_penalty=None, served_model_name='deepseek-v4-flash-0731-w8a8', lora_modules=None, lora_assignment='random', ramp_up_strategy=None, ramp_up_start_rps=None, ramp_up_end_rps=None, ready_check_timeout_sec=0, chat_template_kwargs=None, extra_body=None, skip_tokenizer_init=False, insecure=False, plot_timeline=False, timeline_itl_thresholds='25,50', plot_dataset_stats=False)
`rope_parameters`'s factor field must be a float >= 1, got 16
`rope_parameters`'s beta_fast field must be a float, got 32
`rope_parameters`'s beta_slow field must be a float, got 1
`rope_parameters`'s factor field must be a float >= 1, got 16
`rope_parameters`'s beta_fast field must be a float, got 32
`rope_parameters`'s beta_slow field must be a float, got 1
`rope_parameters`'s factor field must be a float >= 1, got 16
`rope_parameters`'s beta_fast field must be a float, got 32
`rope_parameters`'s beta_slow field must be a float, got 1
`rope_parameters`'s factor field must be a float >= 1, got 16
`rope_parameters`'s beta_fast field must be a float, got 32
`rope_parameters`'s beta_slow field must be a float, got 1
INFO 09-23 03:13:16 [utils.py:90] Sampling input_len from [16000, 16000] and output_len from [2048, 2048]
WARNING: vllm bench serve no longer sets temperature==0 (greedy) in requests by default. The default will be determined on the server side and can be model/API specific. For the old behavior, include --temperature=0.
Starting initial single prompt test run...
Skipping endpoint ready check.
Warming up with 10 requests...
100%|██████████████████████████████████████████████████████████████████████████████████| 10/10 [01:48<00:00, 10.86s/it]
Warmup run completed.
Starting main benchmark run...
Traffic request rate: 5.0
Burstiness factor: 1.0 (Poisson process)
Maximum request concurrency: 32
100%|████████████████████████████████████████████████████████████████████████████| 1000/1000 [2:21:36<00:00,  8.50s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  8496.72
Total input tokens:                      16004000
Total generated tokens:                  2048000
Request throughput (req/s):              0.12
Output token throughput (tok/s):         241.03
Peak output token throughput (tok/s):    209.00
Peak concurrent requests:                35.00
Total token throughput (tok/s):          2124.58
---------------Time to First Token----------------
Mean TTFT (ms):                          113613.13
Median TTFT (ms):                        114355.77
P99 TTFT (ms):                           168534.93
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          76.22
Median TPOT (ms):                        63.86
P99 TPOT (ms):                           179.66
---------------Inter-token Latency----------------
Mean ITL (ms):                           314.41
Median ITL (ms):                         460.58
P99 ITL (ms):                            651.45
---------------Speculative Decoding---------------
Acceptance rate (%):                     44.33
Acceptance length:                       4.10
Drafts:                                  499545
Draft tokens:                            3496815
Accepted tokens:                         1550240
Per-position acceptance (%):
  Position 0:                            74.34
  Position 1:                            58.00
  Position 2:                            49.10
  Position 3:                            43.19
  Position 4:                            38.03
  Position 5:                            29.14
  Position 6:                            18.53
==================================================
```
