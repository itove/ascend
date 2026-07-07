## 推荐系统配置

### 系统镜像部分默认配置
* root 可登录 ssh
* 用户`HwHiAiUser`，uid/gid `1000`
* sshd 支持密码、私钥登录
* sshd `AllowTcpForwarding` 被禁用

### 推荐配置
#### 禁用 root 登录 ssh
应用前请确保已创建其它能正常登录的用户。
```conf
# /etc/ssh/sshd_config
PermitRootLogin no
```

#### 允许通过 ssh 转发 TCP 
```conf
# /etc/ssh/sshd_config
AllowTcpForwarding yes
```
#### 禁用密码登录 ssh 
应用前请确保已配置有效的密钥对
```conf
# /etc/ssh/sshd_config
PasswordAuthentication no
```
