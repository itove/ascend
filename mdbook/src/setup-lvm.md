# 逻辑卷

4 台服务器均配有 2 块数据盘
* `/dev/nvme0n1` 3.5T
* `/dev/nvme1n1` 3.5T

为方便管理数据，用`LVM`将两块盘合并为一个逻辑卷(LV)，得到一个 7.0T 的数据盘。  
* 创建 2 个 PV: `/dev/nvme0n1`, `/dev/nvme1n1`
* 创建 1 个 VG, 名称 `elwynn`, 使用所有 PV
* 创建 1 个 LV, 名称 `stromwind`, 使用 VG `elwynn` 的所有空间
* 格式化 LV `stromwind`, 文件系统 `xfs`
* 挂载 LV `stromwind` 至 `/mnt/d`, 总容量 7.0T

具体操作步骤可参考项目目录中`bin/lvm.sh`，也可直接运行该脚本完成操作。
```bash
#!/bin/bash
#
# vim:ft=bash

set -e

disks=(/dev/nvme0n1 /dev/nvme1n1)

echo DANGEROUS!!!
echo You are about to create a new filesystem, which will DESTROY your data on ${disks[@]}!!!
echo Sure you wanna do this?
read -p "Type YES to confirm. [YES/n] "
[ "$REPLY" != YES ] && exit

vgname=elwynn
lvname=stromwind
mountpoint=/mnt/d

echo Creating PVs for disks: ${disks[@]}
sudo pvcreate ${disks[@]}

echo Create VG $vgname
sudo vgcreate $vgname ${disks[@]}

echo Creating LV $lvname
sudo lvcreate -l 100%FREE -n $lvname $vgname
# sudo lvcreate --extents 100%FREE --name $lvname $vgname

echo Creating xfs filesystem...
sudo mkfs.xfs /dev/$vgname/$lvname

sleep 2

uuid=$(lsblk -n -o UUID -l /dev/$vgname/$lvname)
echo Created: /dev/$vgname/$lvname UUID: $uuid

echo Creating mountpoint: $mountpoint
sudo mkdir $mountpoint

echo Append to /etc/fstab...
sudo sed -i '$a'"UUID=$uuid $mountpoint                  xfs     defaults        0 0" /etc/fstab

echo Mounting...
sudo mount -a
```

运行示例：
```
$ bin/lvm.sh
DANGEROUS!!!
You are about to create a new filesystem, which will DESTROY your data on /dev/nvme0n1 /dev/nvme1n1!!!
Sure you wanna do this?
Type YES to confirm. [YES/n] YES
Creating PVs for disks: /dev/nvme0n1 /dev/nvme1n1
  Physical volume "/dev/nvme0n1" successfully created.
  Physical volume "/dev/nvme1n1" successfully created.
Create VG elwynn
  Volume group "elwynn" successfully created
Creating LV stromwind
WARNING: atari signature detected on /dev/elwynn/stromwind at offset 478. Wipe it? [y/n]: y
  Wiping atari signature on /dev/elwynn/stromwind.
WARNING: atari signature detected on /dev/elwynn/stromwind at offset 490. Wipe it? [y/n]: y
  Wiping atari signature on /dev/elwynn/stromwind.
  Logical volume "stromwind" created.
Creating xfs filesystem...
meta-data=/dev/elwynn/stromwind  isize=512    agcount=7, agsize=268435455 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1
data     =                       bsize=4096   blocks=1875367936, imaxpct=5
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=521728, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
Discarding blocks...Done.
Created: /dev/elwynn/stromwind UUID: da50973c-8cd0-40d1-a43f-2cd1b4941f0a
Creating mountpoint: /mnt/d
Append to /etc/fstab...
Mounting...
```

