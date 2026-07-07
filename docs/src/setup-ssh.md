# 设置 ssh 私钥登录
目的：
* 私钥安全性优于密码
* 私钥在不配置 passphrase 的情况下可免密码登录

在工作站生成钥匙对。以服务器 gx 为例。  
示例未设置私钥 passphrase ，可以按需设置。  
```
$ mkdir -p ~/.ssh && cd ~/.ssh
$ ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/al/.ssh/id_ed25519): gx
Enter passphrase for "gx" (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in gx
Your public key has been saved in gx.pub
The key fingerprint is:
SHA256:e1sX918ewbypbx5MXKMSWHlp8t4sb+LPsnMJyPCGktA al@gx
The key's randomart image is:
+--[ED25519 256]--+
|           .. .  |
|          oo +   |
|      .  . .=  ..|
|     . E .  ..= o|
|      . S =.o.+*.|
|       o o =.+o==|
|        o o . =*+|
|         . o =oB=|
|          . .+%=o|
+----[SHA256]-----+
```
复制公钥至服务器。
```
$ ssh-copy-id -i gx gx
```
