# Proxy

离线环境可配置**proxy**以访问互联网
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

部分工具并不遵循以上环境变量，须相应配置：

### dnf proxy
```
# /etc/dnf/dnf.conf
# Append to [main] section
proxy=socks5://btn:1080

```

### docker proxy
```
$ sudo systemctl edit docker.service
```
add:
```
[Service]
Environment="HTTP_PROXY=socks5://127.0.0.1:8080"
Environment="HTTPS_PROXY=socks5://127.0.0.1:8080"

```

```
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```
### pip proxy
离线环境下，可下载`pysocks`并`cp`至容器[^pip-with-socks-proxy] [^pysocks-dl] [^PySocks.whl]
```
# Download pysocks
$ python3.11 -m pip download pysocks
$ docker cp PySocks-1.7.1-py3-none-any.whl mindie:/root/

```

```
# In container
$ python3 -m pip install /root/PySocks-1.7.1-py3-none-any.whl

$ cd $ATB_SPEED_HOME_PATH/
# then install with proxy
# add option '--progress-bar off' to avoid 'RuntimeError: can't start new thread'
pip3 install -r requirements/models/requirements_llama3.txt --proxy socks5://172.20.10.35:1080 --progress-bar off
# or
all_proxy="socks5://172.20.10.35:1080" pip3 install -r requirements/models/requirements_llama3.txt --progress-bar off
```

[^pip-with-socks-proxy]: [pip-with-socks-proxy](https://stackoverflow.com/a/68745571)
[^pysocks-dl]: [Manually download PySocks](https://stackoverflow.com/a/79702190)
[^PySocks.whl]: [PySocks](https://pypi.org/project/PySocks/#files)
