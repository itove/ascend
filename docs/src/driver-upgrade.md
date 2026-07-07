## Ascend 升级驱动
本文以 HDK 25.5.2 / CANN 9.0.0 为例，后续更新请选择新版本。  

### 下载
1. 访问[固件与驱动](https://www.hiascend.com/hardware/firmware-drivers/community?product=4&model=32&cann=9.0.0&driver=Ascend+HDK+25.5.2)，过滤软件包：
    * `CANN版本`选择`9.0.0`
    * `固件与驱动`选择`Ascend HDK 25.5.2`
    * `CPU架构`选择`AArch64`
    * `软件包格式`选择`rpm`

2. 下载：
    * 驱动`Ascend-hdk-910b-npu-driver-25.5.2-1.aarch64.rpm`
    * 固件`Ascend-hdk-910b-npu-firmware-7.8.0.7.220-1.noarch.rpm`

### 更新
请在在裸金属上更新。**固件不能在虚拟机中更新！必须在裸金属更新！**
#### 更新驱动
```
$ sudo dnf install Ascend-hdk-910b-npu-driver-25.5.2-1.aarch64.rpm
Last metadata expiration check: 0:54:14 ago on Tue 07 Jul 2026 11:58:13 AM CST.
Dependencies resolved.
========================================================================================================================
 Package                           Architecture            Version                   Repository                    Size
========================================================================================================================
Installing:
 Ascend910B-driver                 aarch64                 25.5.2-1                  @commandline                 115 M

Transaction Summary
========================================================================================================================
Install  1 Package

Total size: 115 M
Installed size: 237 M
Is this ok [y/N]: y
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                1/1
  Running scriptlet: Ascend910B-driver-25.5.2-1.aarch64                                                             1/1

[Driver] [2026-07-07 12:52:30] [INFO]Start time: 2026-07-07 12:52:30
[Driver] [2026-07-07 12:52:30] [INFO]LogFile: /var/log/ascend_seclog/ascend_install.log
[Driver] [2026-07-07 12:52:30] [INFO]OperationLogFile: /var/log/ascend_seclog/operation.log
[Driver] [2026-07-07 12:52:30] [INFO]base version is 24.1.rc2.2.
[Driver] [2026-07-07 12:52:30] [WARNING]Do not power off or restart the system during the installation/upgrade
[Driver] [2026-07-07 12:52:30] [INFO]set username and usergroup, HwHiAiUser:HwHiAiUser
[Driver] [2026-07-07 12:52:59] [INFO]This environment has installed run package 24.1.rc2.2, and it will now be uninstall
ed.
[Driver] [2026-07-07 12:52:59] [INFO]base version is 24.1.rc2.2.
[Driver] [2026-07-07 12:53:49] [INFO]Driver package uninstalled successfully! Reboot needed for uninstallation to take e
ffect!

  Installing       : Ascend910B-driver-25.5.2-1.aarch64                                                             1/1
  Running scriptlet: Ascend910B-driver-25.5.2-1.aarch64                                                             1/1

[Driver] [2026-07-07 12:54:21] [INFO]driver install type: DKMS
[Driver] [2026-07-07 12:54:21] [INFO]upgradePercentage:10%
[Driver] [2026-07-07 12:54:28] [INFO]upgradePercentage:30%
[Driver] [2026-07-07 12:54:29] [INFO]upgradePercentage:40%
[Driver] [2026-07-07 12:55:10] [INFO]upgradePercentage:90%
[Driver] [2026-07-07 12:55:12] [INFO]upgradePercentage:100%
[Driver] [2026-07-07 12:56:53] [INFO]Driver package installed successfully! Reboot needed for installation/upgrade to ta
ke effect!
[Driver] [2026-07-07 12:56:53] [INFO]End time: 2026-07-07 12:56:53

  Verifying        : Ascend910B-driver-25.5.2-1.aarch64                                                             1/1

Installed:
  Ascend910B-driver-25.5.2-1.aarch64

Complete!
```

#### 重启裸金属
须重启后才能顺利安装新固件。
```
$ sudo reboot
```
#### 更新固件
```
$ sudo dnf install Ascend-hdk-910b-npu-firmware-7.8.0.7.220-1.noarch.rpm
```

### 相关链接
* [固件与驱动](https://www.hiascend.com/hardware/firmware-drivers/community)
* [CANN 9.0.0版本说明](https://www.hiascend.com/document/detail/zh/canncommercial/900/releasenote/release-notes.md)
* [资源下载中心](https://www.hiascend.com/developer/download)
