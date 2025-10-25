# pip proxy

离线环境下，可下载`pysocks`并`cp`至容器[^pip-with-socks-proxy] [^pysocks-dl] [^PySocks.whl]

下载pysocks
```
$ python3.11 -m pip download pysocks
$ docker cp PySocks-1.7.1-py3-none-any.whl mindie:/root/
```
进入容器
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
