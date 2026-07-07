# 创建用户

1. 登录`root`账号，创建新用户，完成相关配置
1. 推荐日常使用普通用户及`sudo`，避免直接使用`root`

以创建一个名为`al`的用户为例

## 创建用户及密码
其中`passwd`以`--stdin`方式执行，**若系统PAM密码策略不允许相对简单的密码，此方法可以绕过限制。**
```
# username=al
# useradd $username
# echo "NEW_PASSWD" | passwd --stdin $username
```

## 添加用户至 wheel 组
添加用户至`wheel`组，使其可运行`sudo`
```
# usermod -aG wheel $username
```
