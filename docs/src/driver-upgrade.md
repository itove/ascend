# Ascend 升级驱动

## docker
```
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
Edit `/etc/yum.repos.d/docker-ce.repo`, change `$releasever` to `8`.

```
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
