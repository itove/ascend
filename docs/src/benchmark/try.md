# try

## DoSampling True
```
The BenchMark test performance metric result is:
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
|              Metric |        average |            max |            min |            P75 |            P90 |        SLO_P90 |            P99 | N |
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
|      FirstTokenTime |    394.7728 ms |    394.7728 ms |    394.7728 ms |    394.7728 ms |    394.7728 ms |    394.7728 ms |    394.7728 ms | 1 |
|          DecodeTime |    183.7376 ms |    227.1558 ms |     153.524 ms |    205.9031 ms |    222.7119 ms |    183.7376 ms |    226.8792 ms | 1 |
|      LastDecodeTime |    198.8681 ms |    198.8681 ms |    198.8681 ms |    198.8681 ms |    198.8681 ms |    198.8681 ms |    198.8681 ms | 1 |
|       MaxDecodeTime |    227.1558 ms |    227.1558 ms |    227.1558 ms |    227.1558 ms |    227.1558 ms |    227.1558 ms |    227.1558 ms | 1 |
|        GenerateTime |   9582.6747 ms |   9582.6747 ms |   9582.6747 ms |   9582.6747 ms |   9582.6747 ms |   9582.6747 ms |   9582.6747 ms | 1 |
|         InputTokens |          313.0 |            313 |            313 |          313.0 |          313.0 |          313.0 |          313.0 | 1 |
|     GeneratedTokens |           51.0 |             51 |             51 |           51.0 |           51.0 |           51.0 |           51.0 | 1 |
| GeneratedTokenSpeed | 5.3221 token/s | 5.3221 token/s | 5.3221 token/s | 5.3221 token/s | 5.3221 token/s | 5.3221 token/s | 5.3221 token/s | 1 |
| GeneratedCharacters |          110.0 |            110 |            110 |          110.0 |          110.0 |          110.0 |          110.0 | 1 |
|           Tokenizer |     13.7618 ms |     13.7618 ms |     13.7618 ms |     13.7618 ms |     13.7618 ms |     13.7618 ms |     13.7618 ms | 1 |
|         Detokenizer |      1.0186 ms |      1.0186 ms |      1.0186 ms |      1.0186 ms |      1.0186 ms |      1.0186 ms |      1.0186 ms | 1 |
|  CharactersPerToken |         2.1569 |              / |              / |              / |              / |              / |              / | 1 |
|  PostProcessingTime |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms | 1 |
|         ForwardTime |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms | 1 |
|    PrefillBatchsize |            1.0 |              1 |              1 |            1.0 |            1.0 |            1.0 |            1.0 | 1 |
|    DecoderBatchsize |            1.0 |              1 |              1 |            1.0 |            1.0 |            1.0 |            1.0 | 1 |
|       QueueWaitTime |    162.8431 μs |        5102 μs |          55 μs |        67.0 μs |        71.0 μs |        71.0 μs |      2589.5 μs | 1 |
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
[2025-11-07 15:33:18.416+08:00] [56739] [281459100502816] [benchmark] [INFO] [output.py:121]
The BenchMark test common metric result is:
+------------------------+-------------------------------+
|          Common Metric |                         Value |
+------------------------+-------------------------------+
|            CurrentTime |           2025-11-07 15:33:18 |
|            TimeElapsed |                      9.5827 s |
|             DataSource | /gx3/test/dataset_gxm8k.jsonl |
|                 Failed |                     0( 0.0% ) |
|               Returned |                   1( 100.0% ) |
|                  Total |                   1[ 100.0% ] |
|            Concurrency |                           128 |
|              ModelName |                   deepseek-v3 |
|                   lpct |                     1.2613 ms |
|             Throughput |                  0.1044 req/s |
|    OutputGenerateSpeed |                5.3221 token/s |
|     InputGenerateSpeed |               32.6631 token/s |
|     TotalGenerateSpeed |               37.9852 token/s |
| GenerateSpeedPerClient |                0.0416 token/s |
|               accuracy |                             / |
+------------------------+-------------------------------+
Benchmark task completed successfully!
```

## DoSampling False
```
The BenchMark test performance metric result is:
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
|              Metric |        average |            max |            min |            P75 |            P90 |        SLO_P90 |            P99 | N |
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
|      FirstTokenTime |    425.2379 ms |    425.2379 ms |    425.2379 ms |    425.2379 ms |    425.2379 ms |    425.2379 ms |    425.2379 ms | 1 |
|          DecodeTime |    187.5858 ms |    228.2074 ms |    154.3712 ms |    209.7857 ms |    220.8537 ms |    187.5858 ms |    228.1467 ms | 1 |
|      LastDecodeTime |    174.2635 ms |    174.2635 ms |    174.2635 ms |    174.2635 ms |    174.2635 ms |    174.2635 ms |    174.2635 ms | 1 |
|       MaxDecodeTime |    228.2074 ms |    228.2074 ms |    228.2074 ms |    228.2074 ms |    228.2074 ms |    228.2074 ms |    228.2074 ms | 1 |
|        GenerateTime |  10743.6295 ms |  10743.6295 ms |  10743.6295 ms |  10743.6295 ms |  10743.6295 ms |  10743.6295 ms |  10743.6295 ms | 1 |
|         InputTokens |          313.0 |            313 |            313 |          313.0 |          313.0 |          313.0 |          313.0 | 1 |
|     GeneratedTokens |           56.0 |             56 |             56 |           56.0 |           56.0 |           56.0 |           56.0 | 1 |
| GeneratedTokenSpeed | 5.2124 token/s | 5.2124 token/s | 5.2124 token/s | 5.2124 token/s | 5.2124 token/s | 5.2124 token/s | 5.2124 token/s | 1 |
| GeneratedCharacters |          121.0 |            121 |            121 |          121.0 |          121.0 |          121.0 |          121.0 | 1 |
|           Tokenizer |     15.1481 ms |     15.1481 ms |     15.1481 ms |     15.1481 ms |     15.1481 ms |     15.1481 ms |     15.1481 ms | 1 |
|         Detokenizer |      0.4496 ms |      0.4496 ms |      0.4496 ms |      0.4496 ms |      0.4496 ms |      0.4496 ms |      0.4496 ms | 1 |
|  CharactersPerToken |         2.1607 |              / |              / |              / |              / |              / |              / | 1 |
|  PostProcessingTime |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms | 1 |
|         ForwardTime |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms |           0 ms | 1 |
|    PrefillBatchsize |            1.0 |              1 |              1 |            1.0 |            1.0 |            1.0 |            1.0 | 1 |
|    DecoderBatchsize |            1.0 |              1 |              1 |            1.0 |            1.0 |            1.0 |            1.0 | 1 |
|       QueueWaitTime |    164.6786 μs |        5096 μs |          58 μs |        79.0 μs |        81.5 μs |        81.5 μs |     2342.15 μs | 1 |
+---------------------+----------------+----------------+----------------+----------------+----------------+----------------+----------------+---+
[2025-11-07 16:08:55.727+08:00] [58146] [281464647600928] [benchmark] [INFO] [output.py:121]
The BenchMark test common metric result is:
+------------------------+-------------------------------+
|          Common Metric |                         Value |
+------------------------+-------------------------------+
|            CurrentTime |           2025-11-07 16:08:55 |
|            TimeElapsed |                     10.7436 s |
|             DataSource | /gx3/test/dataset_gxm8k.jsonl |
|                 Failed |                     0( 0.0% ) |
|               Returned |                   1( 100.0% ) |
|                  Total |                   1[ 100.0% ] |
|            Concurrency |                           128 |
|              ModelName |                   deepseek-v3 |
|                   lpct |                     1.3586 ms |
|             Throughput |                  0.0931 req/s |
|    OutputGenerateSpeed |                5.2124 token/s |
|     InputGenerateSpeed |               29.1335 token/s |
|     TotalGenerateSpeed |               34.3459 token/s |
| GenerateSpeedPerClient |                0.0407 token/s |
|               accuracy |                             / |
+------------------------+-------------------------------+
Benchmark task completed successfully!
```
