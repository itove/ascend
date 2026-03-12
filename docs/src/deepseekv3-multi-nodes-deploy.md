# DeepseekV3-多机部署文档

## 一、环境准备

### 1、硬件要求

部署DeepSeek-V3模型至少需要4台910B3（8*64G）服务器

### 2、资源包

#### （1）镜像包

mindie_1.0.0-T71.B020-800I-A2-arm64-py3.11.tar.gz

备注：也可前往[昇腾社区/开发资源](https://www.hiascend.com/developer/ascendhub/detail/af85b724a7e5469ebd7ea13c3439d48f)下载适配deepseekv3的镜像包：mindie:1.0.T71-800I-A2-py311-ubuntu22.04-arm64，完成之后，请使用`docker images`命令确认查找具体镜像名称与标签。 

```json
docker load -i mindie:1.0.T71-800I-A2-py311-ubuntu22.04-arm64(下载的镜像名称与标签)
```

#### （2）BF16权重包

deepseekv3-bf16.zip

备注：FB8转化BF16的方法如下，目前npu转换脚本不会自动复制tokenizer等文件。

```json
git clone https://modelers.cn/MindIE/deepseekv3.git
cd NPU_inference/
python fp8_cast_bf16.py --input-fp8-hf-path /path/to/DeepSeek-V3 --output-bf16-hf-path /path/to/deepseek-v3-bf16
```

## 二、部署步骤

### 1、检查机器网络情况

#### （1）确保机器卡间网络连通

a、每台机器执行以下命令，获取每张卡的ip地址

```json
for i in {0..7};do hccn_tool -i $i -ip -g; done
```

返回示例：

```json
ipaddr:11.12.165.80
netmask:255.255.255.0
ipaddr:11.12.165.81
netmask:255.255.255.0
ipaddr:11.12.165.82
netmask:255.255.255.0
ipaddr:11.12.165.83
netmask:255.255.255.0
ipaddr:11.12.165.84
netmask:255.255.255.0
ipaddr:11.12.165.85
netmask:255.255.255.0
ipaddr:11.12.165.86
netmask:255.255.255.0
ipaddr:11.12.165.87
netmask:255.255.255.0
```

b、测试每台机器与其他机器的卡间连通性；

```json
for i in {0..7}; do hccn_tool -i $i -ping -g address 11.12.165.80; done    # 11.12.165.80为卡IP
```

返回示例：

```json
device 0 PING 11.12.165.80
recv seq=0,time=0.114000ms
recv seq=1,time=0.067000ms
recv seq=2,time=0.063000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 1 PING 11.12.165.80
recv seq=0,time=0.149000ms
recv seq=1,time=0.066000ms
recv seq=2,time=0.064000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 2 PING 11.12.165.80
recv seq=0,time=0.140000ms
recv seq=1,time=0.063000ms
recv seq=2,time=0.064000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 3 PING 11.12.165.80
recv seq=0,time=0.154000ms
recv seq=1,time=0.064000ms
recv seq=2,time=0.062000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 4 PING 11.12.165.80
recv seq=0,time=0.142000ms
recv seq=1,time=0.065000ms
recv seq=2,time=0.064000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 5 PING 11.12.165.80
recv seq=0,time=0.139000ms
recv seq=1,time=0.065000ms
recv seq=2,time=0.063000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 6 PING 11.12.165.80
recv seq=0,time=0.143000ms
recv seq=1,time=0.063000ms
recv seq=2,time=0.063000ms
3 packets transmitted, 3 received, 0.00% packet loss
device 7 PING 11.12.165.80
recv seq=0,time=0.157000ms
recv seq=1,time=0.065000ms
recv seq=2,time=0.063000ms
3 packets transmitted, 3 received, 0.00% packet loss
```

#### （2）每台机器检查物理连接

```json
for i in {0..7}; do hccn_tool -i $i -lldp -g | grep Ifname; done 
```

返回示例：

```json
	Ifname: 400GE1/1/5:1
	Ifname: 400GE1/1/5:2
	Ifname: 400GE1/2/5:1
	Ifname: 400GE1/2/5:2
	Ifname: 400GE1/3/5:1
	Ifname: 400GE1/3/5:2
	Ifname: 400GE1/4/5:1
	Ifname: 400GE1/4/5:2
```

#### （3）每台机器检查链接情况

```json
for i in {0..7}; do hccn_tool -i $i -link -g ; done
```

返回示例：

```json
link status: UP
...
link status: UP
```

#### （4）每台机器检查网络健康情况

```json
for i in {0..7}; do hccn_tool -i $i -net_health -g ; done
```

返回示例：

```json
net health status: Success
...
net health status: Success
```

#### （5）每台机器查看侦测ip的配置是否正确

```json
for i in {0..7}; do hccn_tool -i $i -netdetect -g ; done
```

返回示例：

```json
netdetect address: 11.12.165.1
...
netdetect address: 11.12.165.1
```

#### （6）每台机器查看网关是否配置正确

```json
for i in {0..7}; do hccn_tool -i $i -gateway -g ; done
```

返回示例：

```json
default gateway:11.12.165.1, Iface:eth0
default gateway:11.12.165.1, Iface:eth1
default gateway:11.12.165.1, Iface:eth2
default gateway:11.12.165.1, Iface:eth3
default gateway:11.12.165.1, Iface:eth4
default gateway:11.12.165.1, Iface:eth5
default gateway:11.12.165.1, Iface:eth6
default gateway:11.12.165.1, Iface:eth7
```

#### （7）每台机器检查NPU底层tls校验行为一致性，建议全0

```json
for i in {0..7}; do hccn_tool -i $i -tls -g ; done | grep switch
```

返回示例：

```json
dev_id:0, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:1, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:2, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:3, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:4, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:5, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:6, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
dev_id:7, tls switch[0](0:disable, 1:enable), tls preconfigured[1](0:non-preset, 1:preset), tls alarm time threshold[60]days
```

#### （8）每台机器执行NPU底层tls校验行为置0操作

```json
for i in {0..7};do hccn_tool -i $i -tls -s enable 0;done
```

返回示例：

```json
Cmd executed successfully!
...
Cmd executed successfully!
```

### 2、配置rank_table_file.json

```json
{
    "version": "1.0",
    "server_count": "4",   # 总节点数
    # server_list中第一个server为Master节点，其余为Slave节点
    "server_list": [   
        {
            "server_id": "172.30.209.140",   # 当前节点的ip地址
            "container_ip": "172.30.209.140",   # 容器ip地址，若无特殊配置，则与server_id相同
            "device": [
            	# device_id: 当前卡的本机编号,device_ip: 当前卡的ip地址，rank_id: 当前卡的全局编号;
                { "device_id": "0", "device_ip": "11.12.165.20", "rank_id": "0" }, 
                { "device_id": "1", "device_ip": "11.12.165.21", "rank_id": "1" },
                { "device_id": "2", "device_ip": "11.12.165.22", "rank_id": "2" },
                { "device_id": "3", "device_ip": "11.12.165.23", "rank_id": "3" },
                { "device_id": "4", "device_ip": "11.12.165.24", "rank_id": "4" },
                { "device_id": "5", "device_ip": "11.12.165.25", "rank_id": "5" },
                { "device_id": "6", "device_ip": "11.12.165.26", "rank_id": "6" },
                { "device_id": "7", "device_ip": "11.12.165.27", "rank_id": "7" }
            ]
        },
	{
            "server_id": "172.30.209.141",
            "container_ip": "172.30.209.141",
            "device": [
                { "device_id": "0", "device_ip": "11.12.165.30", "rank_id": "8" }, 
                { "device_id": "1", "device_ip": "11.12.165.31", "rank_id": "9" },
                { "device_id": "2", "device_ip": "11.12.165.32", "rank_id": "10" },
                { "device_id": "3", "device_ip": "11.12.165.33", "rank_id": "11" },
                { "device_id": "4", "device_ip": "11.12.165.34", "rank_id": "12" },
                { "device_id": "5", "device_ip": "11.12.165.35", "rank_id": "13" },
                { "device_id": "6", "device_ip": "11.12.165.36", "rank_id": "14" },
                { "device_id": "7", "device_ip": "11.12.165.37", "rank_id": "15" }
            ]
        },
	{
            "server_id": "172.30.209.20",
            "container_ip": "172.30.209.20",
            "device": [
                { "device_id": "0", "device_ip": "11.12.165.90", "rank_id": "16" }, 
                { "device_id": "1", "device_ip": "11.12.165.91", "rank_id": "17" },
                { "device_id": "2", "device_ip": "11.12.165.92", "rank_id": "18" },
                { "device_id": "3", "device_ip": "11.12.165.93", "rank_id": "19" },
                { "device_id": "4", "device_ip": "11.12.165.94", "rank_id": "20" },
                { "device_id": "5", "device_ip": "11.12.165.95", "rank_id": "21" },
                { "device_id": "6", "device_ip": "11.12.165.96", "rank_id": "22" },
                { "device_id": "7", "device_ip": "11.12.165.97", "rank_id": "23" }
            ]
        },
	{
            "server_id": "172.30.210.94",
            "container_ip": "172.30.210.94",
            "device": [
                { "device_id": "0", "device_ip": "11.12.165.80", "rank_id": "24" }, 
                { "device_id": "1", "device_ip": "11.12.165.81", "rank_id": "25" },
                { "device_id": "2", "device_ip": "11.12.165.82", "rank_id": "26" },
                { "device_id": "3", "device_ip": "11.12.165.83", "rank_id": "27" },
                { "device_id": "4", "device_ip": "11.12.165.84", "rank_id": "28" },
                { "device_id": "5", "device_ip": "11.12.165.85", "rank_id": "29" },
                { "device_id": "6", "device_ip": "11.12.165.86", "rank_id": "30" },
                { "device_id": "7", "device_ip": "11.12.165.87", "rank_id": "31" }
            ]
        }
    ],
    "status": "completed"
}
```

### 3、启动容器

每台机器上执行以下启动命令（参考）：

```json
docker run --user root -itd --privileged  --rm --name=mindie-T71 --net=host \
   --shm-size 500g \
   --device=/dev/davinci0 \
   --device=/dev/davinci1 \
   --device=/dev/davinci2 \
   --device=/dev/davinci3 \
   --device=/dev/davinci4 \
   --device=/dev/davinci5 \
   --device=/dev/davinci6 \
   --device=/dev/davinci7 \
   --device=/dev/davinci_manager \
   --device=/dev/hisi_hdc \
   --device /dev/devmm_svm \
   -v /usr/local/Ascend/driver:/usr/local/Ascend/driver \
   -v /usr/local/Ascend/firmware:/usr/local/Ascend/firmware \
   -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi \
   -v /usr/local/sbin:/usr/local/sbin \
   -v /etc/hccn.conf:/etc/hccn.conf \
   -v /data1/20250206/deepseekv3:/iflytek/deepseekv3 \
   -v /data1/20250206/rank_table_file.json:/iflytek/rank_table_file.json \
   mindie:1.0.0-T71.B020-800I-A2-arm64-py3.11 \
   bash
```

### 4、服务化部署

（1）前置准备

a、修改权重目录下config.json文件

```json
将 model_type 更改为 deepseekv2
```

b、修改模型文件夹数组为root，执行权限为750：

```sh
chown -R root:root /iflytek/deepseekv3
chmod -R 750 /iflytek/deepseekv3
```
c、修改rank_table_file.json的执行权限为640：

```
chmod -R 640 /iflytek/rank_table_file.json
```

d、配置环境变量

```json
#开启通信环境变量
export ATB_LLM_HCCL_ENABLE=1
export ATB_LLM_COMM_BACKEND="hccl"
export HCCL_CONNECT_TIMEOUT=7200
export WORLD_SIZE=32
export HCCL_EXEC_TIMEOUT=0
#服务化环境变量
export PYTORCH_NPU_ALLOC_CONF=expandable_segments:True
export MIES_CONTAINER_IP=172.30.209.140                  # 当前容器ip
export RANKTABLEFILE=/iflytek/rank_table_file.json       # rank_table_file.json路径
export HCCL_DETERMINISTIC=true
export NPU_MEMORY_FRACTION=0.96
export OMP_NUM_THREADS=1
export NETWORK_ADAPTER="bond0"
export ASCEND_RT_VISIBLE_DEVICE=0,1,2,3,4,5,6,7
export ATB_LLM_BENCHMARK_ENABLE=1
export ATB_LLM_ENABLE_AUTO_TRANSPOSE=0
export MASTER_IP=172.30.209.140
#加速库等环境变量
source /usr/local/Ascend/ascend-toolkit/set_env.sh
source /usr/local/Ascend/nnal/atb/set_env.sh
source /usr/local/Ascend/mindie/set_env.sh
source /usr/local/Ascend/llm_model/set_env.sh
source /usr/local/Ascend/mindie/latest/mindie-service/set_env.sh
```

e、修改服务化参数

```json
cd /usr/local/Ascend/mindie/latest/mindie-service/
vim conf/config.json
```
每台机器，修改以下参数：
```json
"httpsEnabled" : false,
...
"multiNodesInferEnabled" : true, # 开启多机推理
...
# 若不需要安全认证，则将以下两个参数设为false
"interCommTLSEnabled" : false,
"interNodeTLSEnabled" : false,
...
"modelName" : "DeepseekV3" # 不影响服务化拉起
"modelWeightPath" : "权重路径",

"maxSeqLen" : 4096
"maxIterTimes" : 4096
```
其中主节点机器，另外修改：

```json
"ipAddress" : "172.30.209.140",  # 改成主节点IP
```

f、拉起服务化

```json
# 拉起服务化
cd /usr/local/Ascend/mindie/latest/mindie-service/
./bin/mindieservice_daemon
```

执行命令后，首先会打印本次启动所用的所有参数，然后直到出现以下输出：
```json
Daemon start success!
```
则认为服务成功启动。

5、客户端调用

```json
# ip为主节点ip,port为主节点port
curl --location 'http://ip:port/v1/chat/completions' \
--header 'Authorization: Bearer API-KEY' \
--header 'Content-Type: application/json' \
--data '{
    "model": "DeepSeekV3",
    "stream" : false,
    "messages": [
        {
            "role": "user",
            "content": "你是谁？"
        }
    ]
}'
```


### 常见问题

#### 服务化常见问题
1. 若出现out of memory报错，可适当调高NPU_MEMORY_FRACTION环境变量（默认值为0.8），适当调低服务化配置文件config.json中maxSeqLen、maxInputTokenLen、maxPrefillBatchSize、maxPrefillTokens、maxBatchSize等参数
```
export NPU_MEMORY_FRACTION=0.96
```
2. 若出现hccl通信超时报错，可配置以下环境变量
```
export HCCL_CONNECT_TIMEOUT=7200
export HCCL_EXEC_TIMEOUT=0
```
