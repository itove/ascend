# 代理 proxy

离线环境可配置代理以访问互联网。

## 工作站
工作站中配置`socks`服务
```
sudo dnf install dante
```

## 服务器
服务器上配置`proxy`相关环境变量

```bash
# .bashrc / .profile / .bash_profile
SCHEME=socks5h
SERVER=10.5.1.1
PORT=1080
# ftp_proxy=
export http_proxy=$SCHEME://$SERVER:$PORT
export HTTP_PROXY=$SCHEME://$SERVER:$PORT
export https_proxy=$SCHEME://$SERVER:$PORT
export HTTPS_PROXY=$SCHEME://$SERVER:$PORT
export all_proxy=$SCHEME://$SERVER:$PORT
export ALL_PROXY=$SCHEME://$SERVER:$PORT
export SOCKS_SERVER=$SERVER:$PORT
export SOCKS_VERSION=5
```

以上环境变量，部分工具不遵循，或因特殊性不受影响，须相应配置，具体参考对应小节。
