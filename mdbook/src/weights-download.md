# 下载权重

## 查看磁盘
```
[103021 al@gx1 ~]$ lsblk
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda       8:0    0 446.1G  0 disk
├─sda1    8:1    0    50M  0 part /boot/efi
├─sda2    8:2    0     1G  0 part /boot
├─sda3    8:3    0   445G  0 part /
└─sda4    8:4    0    65M  0 part
nvme0n1 259:0    0   3.5T  0 disk
nvme1n1 259:1    0   3.5T  0 disk
```

```
$ df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs 1023G     0 1023G   0% /dev
tmpfs          tmpfs    1023G     0 1023G   0% /dev/shm
tmpfs          tmpfs    1023G  378M 1022G   1% /run
tmpfs          tmpfs    1023G     0 1023G   0% /sys/fs/cgroup
/dev/sda3      xfs       446G   52G  394G  12% /
tmpfs          tmpfs    1023G   64K 1023G   1% /tmp
/dev/sda2      xfs      1014M  254M  761M  26% /boot
/dev/sda1      vfat       50M  6.5M   44M  13% /boot/efi
tmpfs          tmpfs     205G     0  205G   0% /run/user/0
```

## 创建文件系统并挂载
```
$ sudo mkfs.xfs /dev/nvme0n1
```

```
$ ll /dev/disk/by-uuid/
total 0
...
lrwxrwxrwx 1 root root 13 Oct 23 21:35 a8061502-200a-4971-aa03-a8ef8c6a3b54 -> ../../nvme0n1
...
```

```
$ sudo mkdir /mnt/data
$ sudo mount /dev/nvme0n1 /mnt/data
$ sudo chmod 777 /mnt/data/
```

```
# Edit /etc/fstab
UUID=a8061502-200a-4971-aa03-a8ef8c6a3b54   /mnt/data     xfs     defaults    0 0
```
此时查看磁盘
```
$ lsblk /dev/nvme0n1
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1 259:0    0  3.5T  0 disk /mnt/data
```

```
$ df -hT /dev/nvme0n1
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/nvme0n1   xfs   3.5T   33G  3.5T   1% /mnt/data
```

## NFS
```
# Edit /etc/exports
/mnt/data *(rw,no_root_squash))
```

```
$ sudo systemctl enable --now nfs
```

## 工作站挂载NFS
```
$ mkdir gx
$ sudo mount gx1:/mnt/data gx
```

## 安装huggingface cli
```
$ uv tool install huggingface_hub
```

## 下载权重
```
$ mkdir -p gx/hf/cache gx/hf/models/deepseek-v3
$ cd gx/hf
$ while :; do HF_ENDPOINT=https://hf-mirror.com hf download deepseek-ai/DeepSeek-V3 --cache-dir cache --local-dir models/deepseek-v3 && break; done
```
