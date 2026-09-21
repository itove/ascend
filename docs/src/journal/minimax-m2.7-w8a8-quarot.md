# bench

Remove `--random-prefix-len 12000`

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

maas1
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
