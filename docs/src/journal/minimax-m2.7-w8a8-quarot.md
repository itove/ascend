# bench

Bench on both maas1 and maas2 without `--random-prefix-len 12000`.

maas1
```
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3145.73
Total input tokens:                      16038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.32
Output token throughput (tok/s):         651.04
Peak output token throughput (tok/s):    480.00
Peak concurrent requests:                37.00
Total token throughput (tok/s):          5749.38
---------------Time to First Token----------------
Mean TTFT (ms):                          1537.32
Median TTFT (ms):                        1045.66
P99 TTFT (ms):                           11607.53
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          47.92
Median TPOT (ms):                        47.79
P99 TPOT (ms):                           58.09
---------------Inter-token Latency----------------
Mean ITL (ms):                           92.73
Median ITL (ms):                         71.95
P99 ITL (ms):                            827.26
---------------Speculative Decoding---------------
Acceptance rate (%):                     31.22
Acceptance length:                       1.94
Drafts:                                  1057351
Draft tokens:                            3172053
Accepted tokens:                         990188
Per-position acceptance (%):
  Position 0:                            83.28
  Position 1:                            7.17
  Position 2:                            3.19
==================================================
```

maas2
```
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3146.42
Total input tokens:                      16038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.32
Output token throughput (tok/s):         650.90
Peak output token throughput (tok/s):    481.00
Peak concurrent requests:                36.00
Total token throughput (tok/s):          5748.12
---------------Time to First Token----------------
Mean TTFT (ms):                          1500.20
Median TTFT (ms):                        1047.57
P99 TTFT (ms):                           11614.09
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          47.94
Median TPOT (ms):                        47.75
P99 TPOT (ms):                           56.64
---------------Inter-token Latency----------------
Mean ITL (ms):                           92.90
Median ITL (ms):                         71.95
P99 ITL (ms):                            829.93
---------------Speculative Decoding---------------
Acceptance rate (%):                     31.32
Acceptance length:                       1.94
Drafts:                                  1055610
Draft tokens:                            3166830
Accepted tokens:                         991919
Per-position acceptance (%):
  Position 0:                            83.60
  Position 1:                            7.16
  Position 2:                            3.21
==================================================
```

Restart server with `--enable-prefix-caching`. 2026-09-21 22:35
Bench on both maas1 and maas2, with `--random-prefix-len 12000`. 2026-09-21 11:03

maas1
```
100%|████████████████████████| 1000/1000 [1:02:20<00:00,  3.74s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3740.31
Total input tokens:                      28038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.27
Output token throughput (tok/s):         547.55
Peak output token throughput (tok/s):    448.00
Peak concurrent requests:                36.00
Total token throughput (tok/s):          8043.73
---------------Time to First Token----------------
Mean TTFT (ms):                          2091.66
Median TTFT (ms):                        1420.01
P99 TTFT (ms):                           16728.04
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          56.90
Median TPOT (ms):                        56.73
P99 TPOT (ms):                           69.74
---------------Inter-token Latency----------------
Mean ITL (ms):                           107.91
Median ITL (ms):                         80.65
P99 ITL (ms):                            1096.19
---------------Speculative Decoding---------------
Acceptance rate (%):                     29.90
Acceptance length:                       1.90
Drafts:                                  1079371
Draft tokens:                            3238113
Accepted tokens:                         968172
Per-position acceptance (%):
  Position 0:                            81.42
  Position 1:                            5.83
  Position 2:                            2.45
==================================================
```

maas2
```
100%|████████████████████████| 1000/1000 [1:01:46<00:00,  3.71s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3706.57
Total input tokens:                      28038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.27
Output token throughput (tok/s):         552.53
Peak output token throughput (tok/s):    449.00
Peak concurrent requests:                36.00
Total token throughput (tok/s):          8116.95
---------------Time to First Token----------------
Mean TTFT (ms):                          2154.44
Median TTFT (ms):                        1422.79
P99 TTFT (ms):                           16855.50
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          56.34
Median TPOT (ms):                        56.37
P99 TPOT (ms):                           67.35
---------------Inter-token Latency----------------
Mean ITL (ms):                           107.53
Median ITL (ms):                         80.36
P99 ITL (ms):                            1098.53
---------------Speculative Decoding---------------
Acceptance rate (%):                     30.30
Acceptance length:                       1.91
Drafts:                                  1072480
Draft tokens:                            3217440
Accepted tokens:                         975018
Per-position acceptance (%):
  Position 0:                            82.84
  Position 1:                            5.64
  Position 2:                            2.43
==================================================
```

Both maas1 and maas2 without `--random-prefix-len 12000`.

maas1
```
████████████████████████████████| 1000/1000 [52:31<00:00,  3.15s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3151.17
Total input tokens:                      16038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.32
Output token throughput (tok/s):         649.92
Peak output token throughput (tok/s):    481.00
Peak concurrent requests:                37.00
Total token throughput (tok/s):          5739.46
---------------Time to First Token----------------
Mean TTFT (ms):                          1531.15
Median TTFT (ms):                        1045.22
P99 TTFT (ms):                           11554.96
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          47.93
Median TPOT (ms):                        47.92
P99 TPOT (ms):                           57.46
---------------Inter-token Latency----------------
Mean ITL (ms):                           92.94
Median ITL (ms):                         72.44
P99 ITL (ms):                            827.52
---------------Speculative Decoding---------------
Acceptance rate (%):                     31.35
Acceptance length:                       1.94
Drafts:                                  1055074
Draft tokens:                            3165222
Accepted tokens:                         992421
Per-position acceptance (%):
  Position 0:                            83.34
  Position 1:                            7.33
  Position 2:                            3.39
==================================================
```

maas2
```
████████████████████████████████| 1000/1000 [52:30<00:00,  3.15s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3150.25
Total input tokens:                      16038000
Total generated tokens:                  2048000
Request throughput (req/s):              0.32
Output token throughput (tok/s):         650.11
Peak output token throughput (tok/s):    481.00
Peak concurrent requests:                37.00
Total token throughput (tok/s):          5741.12
---------------Time to First Token----------------
Mean TTFT (ms):                          1558.40
Median TTFT (ms):                        1048.21
P99 TTFT (ms):                           11628.86
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          48.01
Median TPOT (ms):                        47.86
P99 TPOT (ms):                           58.42
---------------Inter-token Latency----------------
Mean ITL (ms):                           92.86
Median ITL (ms):                         72.17
P99 ITL (ms):                            829.49
---------------Speculative Decoding---------------
Acceptance rate (%):                     31.16
Acceptance length:                       1.93
Drafts:                                  1058225
Draft tokens:                            3174675
Accepted tokens:                         989298
Per-position acceptance (%):
  Position 0:                            83.09
  Position 1:                            7.17
  Position 2:                            3.23
==================================================
```

Bench through LiteLLM, with model alias `minimax-m2.7` targeting to group `minimax-m2.7-w8a8-quarot` which have 2 models named `minimax-m2.7-w8a8-quarot`
```
100%|██████████████████████████| 1000/1000 [39:41<00:00,  2.38s/it]
Failed requests during benchmark run detected (capping to 10):
Error 0: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 1: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 2: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 3: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 4: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 5: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 6: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 7: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 8: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 9: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     990
Failed requests:                         10
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  2381.82
Total input tokens:                      15840000
Total generated tokens:                  599270
Request throughput (req/s):              0.42
Output token throughput (tok/s):         251.60
Peak output token throughput (tok/s):    4997.00
Peak concurrent requests:                40.00
Total token throughput (tok/s):          6901.98
---------------Time to First Token----------------
Mean TTFT (ms):                          1531.03
Median TTFT (ms):                        1137.29
P99 TTFT (ms):                           5428.01
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          146.73
Median TPOT (ms):                        140.85
P99 TPOT (ms):                           314.75
---------------Inter-token Latency----------------
Mean ITL (ms):                           70.38
Median ITL (ms):                         57.02
P99 ITL (ms):                            808.69
==================================================
```

Bench through LiteLLM, with model alias `minimax-m2.7` targeting to group `minimax-m2.7-w8a8-quarot` which have 1 model named `minimax-m2.7-w8a8-quarot`
```
100%|██████████████████████████████████████████████████████████████████████████████| 1000/1000 [52:13<00:00,  3.13s/it]
Failed requests during benchmark run detected (capping to 10):
Error 0: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 1: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 2: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 3: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 4: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 5: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 6: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 7: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 8: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

Error 9: Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 393, in async_request_openai_chat_completions
    data = json.loads(chunk)
           ^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 338, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/json/decoder.py", line 356, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     988
Failed requests:                         12
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  3133.47
Total input tokens:                      15808000
Total generated tokens:                  584275
Request throughput (req/s):              0.32
Output token throughput (tok/s):         186.46
Peak output token throughput (tok/s):    5174.00
Peak concurrent requests:                43.00
Total token throughput (tok/s):          5231.34
---------------Time to First Token----------------
Mean TTFT (ms):                          1965.54
Median TTFT (ms):                        1168.35
P99 TTFT (ms):                           12369.17
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          195.51
Median TPOT (ms):                        190.77
P99 TPOT (ms):                           391.86
---------------Inter-token Latency----------------
Mean ITL (ms):                           93.09
Median ITL (ms):                         71.92
P99 ITL (ms):                            830.88
==================================================
```

Bench through nginx -> LiteLLM, with model alias `minimax-m2.7` targeting to group `minimax-m2.7-w8a8-quarot` which have 2 models named `minimax-m2.7-w8a8-quarot`
```
100%|██████████████████████████████████████████████████████████████████████████████| 1000/1000 [10:44<00:00,  1.55it/s]
Failed requests during benchmark run detected (capping to 10):
Error 0: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connec
tion
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1181, in _resolve_host
    return await asyncio.shield(resolved_host_task)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connec
tion
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_th
rottle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_compl
etions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connec
tion
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in nam
e resolution]

Error 1: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connec
tion
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_th
rottle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 2: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_throttle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 3: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_th
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 4: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_throttle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 5: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_th
rottle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 6: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_throttle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

Error 7: Traceback (most recent call last):
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1571, in _create_direct_connection
    hosts = await self._resolve_host(host, port, traces=traces)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1156, in _resolve_host
    await future
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1212, in _resolve_host_with_th
rottle
    addrs = await self._resolver.resolve(host, port, family=self._family)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/resolver.py", line 47, in resolve
    infos = await self._loop.getaddrinfo(
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 905, in getaddrinfo
    return await self.run_in_executor(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/socket.py", line 978, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
socket.gaierror: [Errno -3] Temporary failure in name resolution

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/vllm-workspace/vllm/vllm/benchmarks/lib/endpoint_request_func.py", line 373, in async_request_openai_chat_completions
    async with session.post(url=api_url, json=payload, headers=headers) as response:
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 1693, in __aenter__
    self._resp: _RetType_co = await self._coro
                              ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 858, in _request
    resp = await handler(req)
           ^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/client.py", line 812, in _connect_and_send_request
    conn = await self._connector.connect(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 657, in connect
    proto = await self._create_connection(req, traces, timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1242, in _create_connection
    _, proto = await self._create_direct_connection(req, traces, timeout)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/site-packages/aiohttp/connector.py", line 1577, in _create_direct_connection
    raise ClientConnectorDNSError(req.connection_key, exc) from exc
aiohttp.client_exceptions.ClientConnectorDNSError: Cannot connect to host https:80 ssl:default [Temporary failure in name resolution]

============ Serving Benchmark Result ============
Successful requests:                     0
Failed requests:                         1000
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  644.53
Total input tokens:                      0
Total generated tokens:                  0
Request throughput (req/s):              0.00
Output token throughput (tok/s):         0.00
Peak output token throughput (tok/s):    0.00
Peak concurrent requests:                0.00
Total token throughput (tok/s):          0.00
---------------Time to First Token----------------
Mean TTFT (ms):                          0.00
Median TTFT (ms):                        0.00
P99 TTFT (ms):                           0.00
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          0.00
Median TPOT (ms):                        0.00
P99 TPOT (ms):                           0.00
---------------Inter-token Latency----------------
Mean ITL (ms):                           0.00
Median ITL (ms):                         0.00
P99 ITL (ms):                            0.00
==================================================
Traceback (most recent call last):
  File "/usr/local/python3.12.13/bin/vllm", ine 6, in <module>
    sys.exit(main())
             ^^^^^^
  File "/vllm-workspace/vllm/vllm/entrypoints/cli/main.py", line 95, in main
    args.dispatch_function(args)
  File "/vllm-workspace/vllm/vllm/entrypoints/cli/benchmark/serve.py", line 21, in cmd
    main(args)
  File "/vllm-workspace/vllm/vllm/benchmarks/serve.py", line 1668, in main
    return asyncio.run(main_async(args))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 195, in run
    return runner.run(main)
           ^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/runners.py", line 118, in run
    return self._loop.run_until_complete(task)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/python3.12.13/lib/python3.12/asyncio/base_events.py", line 691, in run_until_complete
    return future.result()
           ^^^^^^^^^^^^^^^
  File "/vllm-workspace/vllm/vllm/benchmarks/serve.py", line 2043, in main_async
    with open(
         ^^^^^
PermissionError: [Errno 13] Permission denied: '/s/public/bench/openai-chat-5.0qps-concurrency32--20260922-094012.json'
[ERROR] 2026-09-22-09:40:12 (PID:1174, Device:-1, RankID:-1) ERR99999 UNKNOWN applicaiton exception
```

```
vllm bench serve \
    --served-model-name minimax-m2.7 \
    --model /s/modelscope/vllm-ascend/MiniMax-M2.7-w8a8-QuaRot/ \
    --base-url "https://ai.zxaicc.com" \
    --backend openai-chat \
    --endpoint /v1/chat/completions \
    --dataset-name random \
    --num-prompts 1000 \
    --request-rate 5 \
    --max-concurrency 32 \
    --random-input-len 16000 \
    --random-output-len 2048 \
    --num-warmups 10 \
    --save-result \
    --header "Authorization=Bearer sk-xxx" \
    --result-dir /s/public/bench/
```

```
100%|████████████████████████████████████| 1000/1000 [39:02<00:00,  2.34s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  2342.28
Total input tokens:                      16000000
Total generated tokens:                  591278
Request throughput (req/s):              0.43
Output token throughput (tok/s):         252.44
Peak output token throughput (tok/s):    2237.00
Peak concurrent requests:                38.00
Total token throughput (tok/s):          7083.39
---------------Time to First Token----------------
Mean TTFT (ms):                          1477.84
Median TTFT (ms):                        1130.64
P99 TTFT (ms):                           5565.63
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          142.71
Median TPOT (ms):                        138.21
P99 TPOT (ms):                           274.53
---------------Inter-token Latency----------------
Mean ITL (ms):                           68.40
Median ITL (ms):                         56.86
P99 ITL (ms):                            807.90
==================================================
```


```
INFO 09-22 14:29:17 [__init__.py:115] Registered model loader `<class 'vllm_ascend.model_loader.rfork.rfork_loader.RForkModelLoader'>` with load format `rfork`
Namespace(subparser='bench', bench_type='serve', dispatch_function=<function BenchmarkServingSubcommand.cmd at 0xfffee572c220>, trust_remote_code=False, seed=0, num_prompts=1000, dataset_name='random', no_stream=False, dataset_path=None, no_oversample=False, skip_chat_template=False, enable_multimodal_chat=False, disable_shuffle=False, custom_output_len=256, custom_ensure_client_side_data=False, spec_bench_output_len=256, spec_bench_category=None, sonnet_input_len=550, sonnet_output_len=150, sonnet_prefix_len=200, sharegpt_output_len=None, timed_trace_chunk_hash_size=16, timed_trace_sec_multiplier=1, timed_trace_label_timestamp='timestamp', timed_trace_label_input_length='input_length', timed_trace_label_output_length='output_length', timed_trace_label_hash_ids='hash_ids', blazedit_min_distance=0.0, blazedit_max_distance=1.0, asr_max_audio_len_sec=inf, asr_min_audio_len_sec=0.0, random_input_len=16000, random_output_len=2048, random_range_ratio='0.0', random_prefix_len=0, random_batch_size=1, no_reranker=False, random_mm_base_items_per_request=1, random_mm_num_mm_items_range_ratio=0.0, random_mm_limit_mm_per_prompt={'image': 255, 'video': 1}, random_mm_bucket_config={(256, 256, 1): 0.5, (720, 1280, 1): 0.5, (720, 1280, 16): 0.0}, hf_subset=None, hf_split=None, hf_name=None, hf_output_len=None, prefix_repetition_prefix_len=256, prefix_repetition_suffix_len=256, prefix_repetition_num_prefixes=10, prefix_repetition_output_len=128, speed_bench_dataset_subset='qualitative', speed_bench_output_len=4096, speed_bench_category=None, label=None, backend='openai-chat', base_url='http://172.20.29.123:4000', host='127.0.0.1', port=8000, endpoint='/v1/chat/completions', header=['Authorization=Bearer sk-QRKTUNIlM0KL4eijxEyyyQ'], max_concurrency=32, model='/s/modelscope/vllm-ascend/MiniMax-M2.7-w8a8-QuaRot/', input_len=None, output_len=None, tokenizer=None, tokenizer_mode='auto', use_beam_search=False, logprobs=None, request_rate=5.0, burstiness=1.0, disable_tqdm=False, num_warmups=10, profile=False, save_result=True, save_detailed=False, append_result=False, metadata=None, result_dir='/s/public/bench/', result_filename=None, ignore_eos=False, self_timed=None, percentile_metrics=None, metric_percentiles='99', goodput=None, request_id_prefix='bench-8d441e7b-', top_p=None, top_k=None, min_p=None, temperature=None, frequency_penalty=None, presence_penalty=None, repetition_penalty=None, served_model_name='minimax-m2.7-w8a8-quarot', lora_modules=None, lora_assignment='random', ramp_up_strategy=None, ramp_up_start_rps=None, ramp_up_end_rps=None, ready_check_timeout_sec=0, chat_template_kwargs=None, extra_body=None, skip_tokenizer_init=False, insecure=False, plot_timeline=False, timeline_itl_thresholds='25,50', plot_dataset_stats=False)
INFO 09-22 14:29:19 [utils.py:90] Sampling input_len from [16000, 16000] and output_len from [2048, 2048]
WARNING: vllm bench serve no longer sets temperature==0 (greedy) in requests by default. The default will be determined on the server side and can be model/API specific. For the old behavior, include --temperature=0.
Starting initial single prompt test run...
Skipping endpoint ready check.
Warming up with 10 requests...
100%|███████████████████████████████████████████████████████████████████████████████████████████████████| 10/10 [00:46<00:00,  4.69s/it]
Warmup run completed.
Starting main benchmark run...
Traffic request rate: 5.0
Burstiness factor: 1.0 (Poisson process)
Maximum request concurrency: 32
100%|███████████████████████████████████████████████████████████████████████████████████████████████| 1000/1000 [38:30<00:00,  2.31s/it]
tip: install termplotlib and gnuplot to plot the metrics
============ Serving Benchmark Result ============
Successful requests:                     1000
Failed requests:                         0
Maximum request concurrency:             32
Request rate configured (RPS):           5.00
Benchmark duration (s):                  2310.05
Total input tokens:                      16000000
Total generated tokens:                  610725
Request throughput (req/s):              0.43
Output token throughput (tok/s):         264.38
Peak output token throughput (tok/s):    2541.00
Peak concurrent requests:                38.00
Total token throughput (tok/s):          7190.62
---------------Time to First Token----------------
Mean TTFT (ms):                          1537.90
Median TTFT (ms):                        1149.45
P99 TTFT (ms):                           4584.06
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          139.44
Median TPOT (ms):                        134.46
P99 TPOT (ms):                           302.72
---------------Inter-token Latency----------------
Mean ITL (ms):                           67.51
Median ITL (ms):                         56.77
P99 ITL (ms):                            804.69
==================================================
```
