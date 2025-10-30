# 配置

## rank_table
```
{
    "version": "1.0",
    "server_count": "4",
    "server_list": [
        {
            "server_id": "172.20.84.67",
            "container_ip": "172.20.84.67",
            "device": [
                { "device_id": "0", "device_ip": "172.20.61.1", "rank_id": "0" },
                { "device_id": "1", "device_ip": "172.20.61.2", "rank_id": "1" },
                { "device_id": "2", "device_ip": "172.20.61.3", "rank_id": "2" },
                { "device_id": "3", "device_ip": "172.20.61.4", "rank_id": "3" },
                { "device_id": "4", "device_ip": "172.20.61.5", "rank_id": "4" },
                { "device_id": "5", "device_ip": "172.20.61.6", "rank_id": "5" },
                { "device_id": "6", "device_ip": "172.20.61.7", "rank_id": "6" },
                { "device_id": "7", "device_ip": "172.20.61.8", "rank_id": "7" }
            ]
        },
        {
            "server_id": "172.20.84.77",
            "container_ip": "172.20.84.77",
            "device": [
                { "device_id": "0", "device_ip": "172.20.60.25", "rank_id": "8" },
                { "device_id": "1", "device_ip": "172.20.60.26", "rank_id": "9" },
                { "device_id": "2", "device_ip": "172.20.60.27", "rank_id": "10" },
                { "device_id": "3", "device_ip": "172.20.60.28", "rank_id": "11" },
                { "device_id": "4", "device_ip": "172.20.60.29", "rank_id": "12" },
                { "device_id": "5", "device_ip": "172.20.60.30", "rank_id": "13" },
                { "device_id": "6", "device_ip": "172.20.60.31", "rank_id": "14" },
                { "device_id": "7", "device_ip": "172.20.60.32", "rank_id": "15" }
            ]
        },
        {
            "server_id": "172.20.84.189",
            "container_ip": "172.20.84.189",
            "device": [
                { "device_id": "0", "device_ip": "172.20.60.1", "rank_id": "16" }, 
                { "device_id": "1", "device_ip": "172.20.60.2", "rank_id": "17" },
                { "device_id": "2", "device_ip": "172.20.60.3", "rank_id": "18" },
                { "device_id": "3", "device_ip": "172.20.60.4", "rank_id": "19" },
                { "device_id": "4", "device_ip": "172.20.60.5", "rank_id": "20" },
                { "device_id": "5", "device_ip": "172.20.60.6", "rank_id": "21" },
                { "device_id": "6", "device_ip": "172.20.60.7", "rank_id": "22" },
                { "device_id": "7", "device_ip": "172.20.60.8", "rank_id": "23" }
            ]
        },
        {
            "server_id": "172.20.84.50",
            "container_ip": "172.20.84.50",
            "device": [
                { "device_id": "0", "device_ip": "172.20.60.9", "rank_id": "24" },
                { "device_id": "1", "device_ip": "172.20.60.10", "rank_id": "25" },
                { "device_id": "2", "device_ip": "172.20.60.11", "rank_id": "26" },
                { "device_id": "3", "device_ip": "172.20.60.12", "rank_id": "27" },
                { "device_id": "4", "device_ip": "172.20.60.13", "rank_id": "28" },
                { "device_id": "5", "device_ip": "172.20.60.14", "rank_id": "29" },
                { "device_id": "6", "device_ip": "172.20.60.15", "rank_id": "30" },
                { "device_id": "7", "device_ip": "172.20.60.16", "rank_id": "31" }
            ]
        }
    ],
    "status": "completed"
}

```

## 服务化配置 config.json

```
{
    "Version" : "1.0.0",

    "ServerConfig" :
    {
        "ipAddress" : "172.20.84.67",
        "managementIpAddress" : "127.0.0.2",
        "port" : 1025,
        "managementPort" : 1026,
        "metricsPort" : 1027,
        "allowAllZeroIpListening" : false,
        "maxLinkNum" : 300,
        "httpsEnabled" : false,
        "fullTextEnabled" : false,
        "tlsCaPath" : "security/ca/",
        "tlsCaFile" : ["ca.pem"],
        "tlsCert" : "security/certs/server.pem",
        "tlsPk" : "security/keys/server.key.pem",
        "tlsPkPwd" : "security/pass/key_pwd.txt",
        "tlsCrlPath" : "security/certs/",
        "tlsCrlFiles" : ["server_crl.pem"],
        "managementTlsCaFile" : ["management_ca.pem"],
        "managementTlsCert" : "security/certs/management/server.pem",
        "managementTlsPk" : "security/keys/management/server.key.pem",
        "managementTlsPkPwd" : "security/pass/management/key_pwd.txt",
        "managementTlsCrlPath" : "security/management/certs/",
        "managementTlsCrlFiles" : ["server_crl.pem"],
        "kmcKsfMaster" : "tools/pmt/master/ksfa",
        "kmcKsfStandby" : "tools/pmt/standby/ksfb",
        "inferMode" : "standard",
        "interCommTLSEnabled" : false,
        "interCommPort" : 1121,
        "interCommTlsCaPath" : "security/grpc/ca/",
        "interCommTlsCaFiles" : ["ca.pem"],
        "interCommTlsCert" : "security/grpc/certs/server.pem",
        "interCommPk" : "security/grpc/keys/server.key.pem",
        "interCommPkPwd" : "security/grpc/pass/key_pwd.txt",
        "interCommTlsCrlPath" : "security/grpc/certs/",
        "interCommTlsCrlFiles" : ["server_crl.pem"],
        "openAiSupport" : "vllm",
        "tokenTimeout" : 600,
        "e2eTimeout" : 600,
        "distDPServerEnabled":false
    },

    "BackendConfig" : {
        "backendName" : "mindieservice_llm_engine",
        "npuDeviceIds" : [[0,1,2,3]],
        "modelInstanceNumber" : 1,
        "tokenizerProcessNumber" : 8,
        "multiNodesInferEnabled" : true,
        "multiNodesInferPort" : 1120,
        "interNodeTLSEnabled" : false,
        "interNodeTlsCaPath" : "security/grpc/ca/",
        "interNodeTlsCaFiles" : ["ca.pem"],
        "interNodeTlsCert" : "security/grpc/certs/server.pem",
        "interNodeTlsPk" : "security/grpc/keys/server.key.pem",
        "interNodeTlsPkPwd" : "security/grpc/pass/mindie_server_key_pwd.txt",
        "interNodeTlsCrlPath" : "security/grpc/certs/",
        "interNodeTlsCrlFiles" : ["server_crl.pem"],
        "interNodeKmcKsfMaster" : "tools/pmt/master/ksfa",
        "interNodeKmcKsfStandby" : "tools/pmt/standby/ksfb",
        "ModelDeployConfig" :
        {
            "maxSeqLen" : 2560,
            "maxInputTokenLen" : 2048,
            "truncation" : false,
            "ModelConfig" : [
                {
                    "modelInstanceType" : "Standard",
                    "modelName" : "deepseek-v3",
                    "modelWeightPath" : "/data2/hf/models/deepseek-v3-bf16",
                    "worldSize" : 4,
                    "cpuMemSize" : 5,
                    "npuMemSize" : -1,
                    "backendType" : "atb",
                    "trustRemoteCode" : false,
                    "async_scheduler_wait_time": 120,
                    "kv_trans_timeout": 10,
                    "kv_link_timeout": 1080
                }
            ]
        },

        "ScheduleConfig" :
        {
            "templateType" : "Standard",
            "templateName" : "Standard_LLM",
            "cacheBlockSize" : 128,

            "maxPrefillBatchSize" : 50,
            "maxPrefillTokens" : 8192,
            "prefillTimeMsPerReq" : 150,
            "prefillPolicyType" : 0,

            "decodeTimeMsPerReq" : 50,
            "decodePolicyType" : 0,

            "maxBatchSize" : 200,
            "maxIterTimes" : 512,
            "maxPreemptCount" : 0,
            "supportSelectBatch" : false,
            "maxQueueDelayMicroseconds" : 5000
        }
    }
}

```
