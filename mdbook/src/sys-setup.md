# System setup

## Create user
```bash
$ username=al
$ useradd $username
$ usermod -aG wheel $username
$ echo "NEW_PASSWD" | passwd --stdin $username # 若系统`PAM`密码策略不允许简单密码，此方法可以绕过

```

## SSH key
