# NFS

主机`gx3`通过`NFS`共享数据。

**在`gx3`上**编辑`/etc/exports`，添加：
```
/mnt/d *(rw,no_root_squash)
```
启动`nfs`，并开机自启动
```
sudo systemctl enable --now nfs
```

**On gx1, gx2, gx4**, mount `gx3:/mnt/d` at `/mnt/gx3`
```
$ sudo mkdir /mnt/gx3
$ sudo mount 172.20.84.189:/mnt/d /mnt/gx3
```
**On gx3**, create symlink `/mnt/gx3` -> `/mnt/d`, so all 4 hosts can use the same path `/mnt/gx3`
```
[al@gx3 ~]$ cd /mnt
[al@gx3 ~]$ sudo ln -s d gx3
```
