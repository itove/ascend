# Issue 1

### 更新
服务化config.json中ModelConfig下增加如下并行参数后，启动无报错，正常运行。
```
{
    "BackendConfig": {
        "ModelDeployConfig": {
            "ModelConfig": [
                {
                    "dp": 4,
                    "tp": 8,
                    "moe_tp": 1,
                    "moe_ep": 32
                }
            ]
        }
    }
}
```

问题解决。

---

### 系统环境
* 4台8 * 910B3
* docker 部署
* MindIE 镜像版本 2.1.RC2-800I-A2-py311-openeuler24.03-lts
* 权重为huggingface下载的deepseek-ai/DeepSeek-V3，用NPU_inference的fp8_cast_bf16.py脚本转换为bf16，转换过程未报错
* 权重目录config.json里的model_type按相关文档提示修改为了deepseekv2
* 权重文件存储在主服务器上，通过NFS共享给其它三台，路径一致

### 驱动版本信息
```
# cat /usr/local/Ascend/driver/version.info
Version=24.1.rc2.2
ascendhal_version=7.35.23
aicpu_version=1.0
tdt_version=1.0
log_version=1.0
prof_version=2.0
dvppkernels_version=1.1
tsfw_version=1.0
Innerversion=V100R001C18SPC001B233
compatible_version=[V100R001C30],[V100R001C13],[V100R001C15],[V100R001C17],[V100R001C18]
compatible_version_fw=[7.0.0,7.2.99]
package_version=24.1.rc2.2

```

### MindIE推理部署
4台均输出
```
Daemon start success!
```

### 服务接口测试
#### 请求
```
curl --location 'http://172.20.84.67:1025/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data '
{
    "model": "deepseek-v3",
    "messages": [{
        "role": "user",
        "content": "who are you?"
    }]
}
'
```

#### 返回
![](https://fileserver.developer.huaweicloud.com/FileServer/getFile/cmtybbs/984/8c8/ac0/0e3c448cb19848c8ac08f6a6ff89bfd5.20251029110922.83621947638015996747743137246305:20251030124016:2400:65859DB1C8093E0A033BF375FB619DB6406F133C71209BE78B8AEAE65EC83D69.png)

### 日志
日志中有大量类似报错，不知是否相关
```
[error] [1079] [multi_latent_attention_operation.cpp:91] headNum should be {8,16,32,64,128}
```

### 调试
尝试修改了

`/mnt/data2/hf/models/deepseek-v3-bf16/inference/configs/config_671B.json`
```
"dtype": "fp8"
```
to
```
"dtype": "bf16"
```

`/mnt/data2/hf/models/deepseek-v3-bf16/config.json`
```
"quant_method": "fp8"
```
to
```
"quant_method": "bf16"
```
但是没有效果。
现在不确定可能是哪里的问题？不知道和切分、并行有没有关系。

### 其它相关测试
**一个细节是，DeepSeek-R1-Distill-Qwen-1.5B单机正常，而多机却出现乱码。**
## 单机4卡
* [x] deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B
* [x] deepseek-ai/DeepSeek-R1-Distill-Llama-8B
* [x] NousResearch/Meta-Llama-3-8B

## 单机8卡
* [x] deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B
* [x] deepseek-ai/DeepSeek-R1-Distill-Llama-8B
* [x] NousResearch/Meta-Llama-3-8B

## 多机（4台）
* [ ] deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B **(成功启动。乱码)**
* [x] deepseek-ai/DeepSeek-R1-Distill-Llama-8B
* [x] NousResearch/Meta-Llama-3-8B
* [ ] deepseek-ai/DeepSeek-V3 **(成功启动。乱码)**
* [ ] deepseek-ai/DeepSeek-V3-0324 **(成功启动。乱码)**
