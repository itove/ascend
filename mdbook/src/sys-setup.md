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

```

```
# in container
python3 -m pip install /root/PySocks-1.7.1-py3-none-any.whl
# then install with proxy
pip3 install -r requirements/models/requirements_llama3.txt --proxy socks5://172.20.10.35:1080
# or
all_proxy="socks5://172.20.10.35:1080" pip3 install -r requirements/models/requirements_llama3.txt
```
