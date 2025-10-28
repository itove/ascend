```
MIES_CONTAINER_IP=172.20.84.67 RANK_TABLE_FILE=/data/rank_table.json HCCL_DETERMINISTIC=true  bin/mindieservice_daemon

```
npuDeviceID does not allow repetitive element
The size of npuDeviceIds does not equal to modelInstanceNumber
The size of npuDeviceIds does not equal to worldSize 

```
(inference) [105841 al@gx1 inference]$ uv add -r requirements.txt -p 3.11
Resolved 39 packages in 5.49s
error: Distribution `triton==3.0.0 @ registry+https://pypi.org/simple` can't be installed because it doesn't have a source distribution or wheel for the current platform

hint: You're on Linux (`manylinux_2_28_aarch64`), but `triton` (v3.0.0) only has wheels for the following platforms: `manylinux_2_17_x86_64`, `manylinux2014_x86_64`; consider adding "sys_platform == 'linux' and platform_machine == 'aarch64'" to `tool.uv.required-environments` to ensure uv resolves to a version with compatible wheels
```

```
[root@gx1 inference]# pip3 install -r requirements.txt --proxy socks5://172.20.10.76:1080
Looking in indexes: https://mirrors.aliyun.com/pypi/simple/
Collecting torch==2.4.1 (from -r requirements.txt (line 1))
  Downloading https://mirrors.aliyun.com/pypi/packages/8f/a1/b31f94b4631c1731261db9fdc9a749ef58facc3b76094a6fe974f611f239/torch-2.4.1-cp311-cp311-manylinux2014_aarch64.whl (89.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 89.7/89.7 MB 166.4 kB/s eta 0:00:00
ERROR: Could not find a version that satisfies the requirement triton==3.0.0 (from versions: 3.5.0)
ERROR: No matching distribution found for triton==3.0.0
```


```
...
[ERROR] TBE Subprocess[task_distribute] raise error[], main process disappeared!
/usr/lib64/python3.11/multiprocessing/resource_tracker.py:254: UserWarning: resource_tracker: There appear to be 30 leaked semaphore objects to clean up at shutdown
  warnings.warn('resource_tracker: There appear to be %d ' 
...
Daemon is killing...
Killed
```

```
The futex facility returned an unexpected error code.
Aborted (core dumped)
```

<https://www.hiascend.com/document/detail/zh/mindie/21RC2/envdeployment/instg/mindie_instg_0026.html>
> 若使用容器化部署启动，要求共享内存设置不小于1GB。


mindie 2.2.T30
```
bin/mindieservice_daemon: error while loading shared libraries: libtorch.so: cannot open shared object file: No such file or directory
```

mindie 2.0.T3.1
```
LLMInferEngine failed to init LLMInferModels
ERR: Failed to init endpoint! Please check the service log or console output.
Killed
```
set log output, it's because 2.0 use env RANKTABLEFILE.

```
[llm] [ERROR] [acl_nn_operation.cpp:143] gmmNode call SetAclNNWorkspaceExecutor fail, error:161002
```
<https://www.hiascend.com/document/detail/zh/Atlas200IDKA2DeveloperKit/23.0.RC2/Application%20Development%20Guide/aadgc/aclcppdevg_03_0615.html>
<https://www.hiascend.com/forum/thread-02108180960559699008-1-1.html>
