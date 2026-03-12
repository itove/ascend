# 仓库

当前系统配置了本地仓库，并禁用了银河麒麟默认仓库。  
该本地仓库无法满足需求，故在此恢复默认仓库。

```
$ sudo mv /etc/yum.repos.d/base.repo /etc/yum.repos.d/back/
$ sudo mv /etc/yum.repos.d/back/kylin_aarch64.repo /etc/yum.repos.d/
```
