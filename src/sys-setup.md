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
