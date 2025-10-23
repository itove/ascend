# System setup

## Create user
```bash
username=al
useradd $username
usermod -aG wheel $username
echo "NEW_PASSWD" | passwd --stdin $username

```

## SSH key

## Proxy

## dnf proxy
```
# /etc/dnf/dnf.conf
# Append to [main] section
proxy=socks5://btn:1080

```

## docker proxy
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

```
# down load pysocks
python3.11 -m pip download pysocks
docker cp PySocks-1.7.1-py3-none-any.whl mindie:/root/

```

```
# In container
python3 -m pip install /root/PySocks-1.7.1-py3-none-any.whl

cd $ATB_SPEED_HOME_PATH/
# then install with proxy
# --progress-bar off to avoid 'RuntimeError: can't start new thread'
pip3 install -r requirements/models/requirements_llama3.txt --proxy socks5://172.20.10.35:1080 --progress-bar off
# or
all_proxy="socks5://172.20.10.35:1080" pip3 install -r requirements/models/requirements_llama3.txt --progress-bar off
```
