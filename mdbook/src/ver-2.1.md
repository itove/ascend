# 版本信息 MindIE 2.1.RC2-800I-A2-py311-openeuler24.03-lts

```
# cat /usr/local/Ascend/ascend-toolkit/latest/version.cfg
# version: 1.0
runtime_running_version=[8.2.0.2.220:8.2.RC2]
compiler_running_version=[8.2.0.2.220:8.2.RC2]
hccl_running_version=[8.2.0.2.220:8.2.RC2]
opp_running_version=[8.2.0.2.220:8.2.RC2]
toolkit_running_version=[8.2.0.2.220:8.2.RC2]
aoe_running_version=[8.2.0.2.220:8.2.RC2]
ncs_running_version=[8.2.0.2.220:8.2.RC2]
opp_kernel_running_version=[8.2.0.2.220:8.2.RC2]
runtime_upgrade_version=[8.2.0.2.220:8.2.RC2]
compiler_upgrade_version=[8.2.0.2.220:8.2.RC2]
hccl_upgrade_version=[8.2.0.2.220:8.2.RC2]
opp_upgrade_version=[8.2.0.2.220:8.2.RC2]
toolkit_upgrade_version=[8.2.0.2.220:8.2.RC2]
aoe_upgrade_version=[8.2.0.2.220:8.2.RC2]
ncs_upgrade_version=[8.2.0.2.220:8.2.RC2]
opp_kernel_upgrade_version=[8.2.0.2.220:8.2.RC2]
runtime_installed_version=[8.2.0.2.220:8.2.RC2]
compiler_installed_version=[8.2.0.2.220:8.2.RC2]
hccl_installed_version=[8.2.0.2.220:8.2.RC2]
opp_installed_version=[8.2.0.2.220:8.2.RC2]
toolkit_installed_version=[8.2.0.2.220:8.2.RC2]
aoe_installed_version=[8.2.0.2.220:8.2.RC2]
ncs_installed_version=[8.2.0.2.220:8.2.RC2]
opp_kernel_installed_version=[8.2.0.2.220:8.2.RC2]
```

```
# ll /usr/local/Ascend/ascend-toolkit/latest/
total 20
dr-xr-xr-x 14 root root  280 Sep 21 17:01 aarch64-linux
lrwxrwxrwx  1 root root   18 Sep 21 16:55 acllib -> ../8.2.RC2/runtime
lrwxrwxrwx  1 root root   13 Sep 21 17:01 arm64-linux -> aarch64-linux
lrwxrwxrwx  1 root root   14 Sep 21 16:56 atc -> ../8.2.RC2/atc
lrwxrwxrwx  1 root root   17 Sep 21 17:03 bin -> aarch64-linux/bin
lrwxrwxrwx  1 root root   26 Sep 21 17:00 bisheng_toolkit -> ../8.2.RC2/bisheng_toolkit
lrwxrwxrwx  1 root root   19 Sep 21 16:56 compiler -> ../8.2.RC2/compiler
lrwxrwxrwx  1 root root   18 Sep 21 17:03 conf -> aarch64-linux/conf
lrwxrwxrwx  1 root root   20 Sep 21 16:56 fwkacllib -> ../8.2.RC2/fwkacllib
lrwxrwxrwx  1 root root   15 Sep 21 16:56 hccl -> ../8.2.RC2/hccl
lrwxrwxrwx  1 root root   21 Sep 21 17:03 include -> aarch64-linux/include
lrwxrwxrwx  1 root root   19 Sep 21 17:03 lib64 -> aarch64-linux/lib64
lrwxrwxrwx  1 root root   29 Sep 21 17:01 mindstudio-toolkit -> ../8.2.RC2/mindstudio-toolkit
lrwxrwxrwx  1 root root   14 Sep 21 16:59 opp -> ../8.2.RC2/opp
lrwxrwxrwx  1 root root   21 Sep 21 17:04 opp_kernel -> ../8.2.RC2/opp_kernel
lrwxrwxrwx  1 root root   14 Sep 21 16:58 ops -> ../8.2.RC2/opp
-rw-rw-r--  1 root root   16 Sep 21 17:01 platform.ini
lrwxrwxrwx  1 root root   16 Sep 21 17:01 pyACL -> ../8.2.RC2/pyACL
drwxr-xr-x  3 root root   27 Sep 21 16:56 python
-r-xr-x---  1 root root 4677 Sep 21 17:03 remove_latest_softlink.sh
lrwxrwxrwx  1 root root   18 Sep 21 16:55 runtime -> ../8.2.RC2/runtime
lrwxrwxrwx  1 root root   23 Sep 21 17:01 test-ops -> ../8.2.RC2/opp/test-ops
lrwxrwxrwx  1 root root   18 Sep 21 17:00 toolkit -> ../8.2.RC2/toolkit
drwxr-xr-x  2 root root 4096 Sep 21 17:01 tools
drwxr-xr-x  3 root root  109 Sep 21 16:55 var
-rw-r--r--  1 root root 1102 Sep 21 17:04 version.cfg
```

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

```
# cat /usr/local/Ascend/atb-models/version.info
MindIE-ATB Tag/Branch : master
MindIE-ATB Version :
ATB-Models Version :
Commit id : 8a0bb889056f2c40e256bae4aef32cdcfbf81334
Platform : aarch64
Time: 2025-09-21 04:43:22 PM CST
```

```
# cat /usr/local/Ascend/mindie/latest/version.info
Ascend-mindie : MindIE 2.1.RC2.B080
mindie-rt: 2.1.RC2.B080
mindie-torch: 2.1.RC2.B080
mindie-service: 2.1.RC2.B080
mindie-llm: 2.1.RC2.B080
mindie-sd:2.1.RC2.B080
Platform : aarch64
```

```
# cat /usr/local/Ascend/nnal/atb/latest/version.info
    Ascend-cann-atb : 8.2.RC2
    Ascend-cann-atb Version : 8.2.RC2.B030
    Platform : aarch64
    branch : br_release_cann_8.2.RC1_20251226
    commit id : 02a94694766ebf12d820aa4b5d9c95c4fe149379
```
