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
