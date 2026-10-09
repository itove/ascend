[昇腾0 Dday支持MiniMax H3，加速SOTA视频模型走向“商业级生产”](https://www.hiascend.com/activities/dynamic-news/755)
[vllm-omni](ttps://gitcode.com/Ascend/MindIE-SD/blob/dev/examples/minimax-h3/infer.md)

```bash
SHM_SIZE=2000 CONTAINER_NAME=minimix-h3 DOCKER_IMAGE=quay.io/ascend/vllm-omni DOCKER_IMAGE_TAG=v0.28.0 /mnt/s/ascend/vllm/bin/docker-run.sh
```

```
# serve-minimax-h3.sh

set -e

. /s/ascend/vllm/ENVs

export PORT=9098
export VLLM_WORKER_MULTIPROC_METHOD=spawn
export VLLM_OMNI_VIDEO_SYNC_TIMEOUT=4000
export PYTHONDONTWRITEBYTECODE=1
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export MINDIE_SD_FA_TYPE="ascend_laser_attention"
export HCCL_NPU_SOCKET_PORT_RANGE="auto"

vllm serve $MODEL_PATH \
  --served-model-name $MODEL_NAME \
  --omni \
  --host 0.0.0.0 \
  --port "${PORT}" \
  --trust-remote-code \
  --task-type fl2va \
  --num-gpus 8 \
  --usp 8 \
  --ring 1 \
  --text-encoder-tp-size 8 \
  --vae-parallel-mode tile \
  --vae-use-tiling \
  --vae-patch-parallel-size 8 \
  --enable-distributed-layerwise-offload \
  --enable-diffusion-pipeline-profiler \
  --diffusion-quantization-config '{"transformer":{"method":"int8"}}' \
  --diffusion-attention-config '{"default": {"backend": "RAINFUSION_ATTN",
      "block_sparse": {"sparsity": 0.8, "start_step": 12}}}'

```

Error
```
(DiffusionWorker_SP3 pid=237) RuntimeError: create_config:../torch_npu/csrc/distributed/HCCLUtils.cpp:140 HCCL function error: hcclCommInitRootInfoConfig(numRanks, &rootInfo, rank, config, &(comm->hcclComm_)), error code is 1
(DiffusionWorker_SP3 pid=237) [ERROR] 2026-10-09-08:38:05 (PID:237, Device:3, RankID:3) ERR02200 DIST call hccl api failed.
(DiffusionWorker_SP3 pid=237) [PID: 237] 2026-10-09-08:38:04.978.003 Communication_Error_Ranktable_Detect(EI0015): Failed to collect cluster information of the communicator based on rootInfo detection. Reason: No rank in the communicator can connect to the root node within the timeout period. List of unconnected ranks: "[1,7,]".
(DiffusionWorker_SP3 pid=237)         Solution: 1. Check whether all ranks in the communicator have delivered the communicator creation interface. 2. Check the connectivity between the host networks of all nodes and the server node. 3. Check whether the HCCL_SOCKET_IFNAME environment variable of all nodes is correctly configured. 4. Increase the timeout by configuring the HCCL_CONNECT_TIMEOUT environment variable.
```
