# docker proxy

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
