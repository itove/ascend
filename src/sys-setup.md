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

## dnf Proxy
```
# /etc/dnf/dnf.conf
# Append to [main] section
proxy=socks5://btn:1080

```
