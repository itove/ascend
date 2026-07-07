## 安装 docker

系统以 openEuler 22.03 LTS / 5.10.0-60.18.0.50.oe2203.aarch64 为例，其它 Fedora / CentOS 衍生分支均可参考。

详情参见 [Install Docker Engine on CentOS](https://docs.docker.com/engine/install/centos/) 。

```bash
# Set up docker repo
$ sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Edit `/etc/yum.repos.d/docker-ce.repo`, change `$releasever` to `8`.
$ sudo sed -i.bak s/\$releasever/8/ /etc/yum.repos.d/docker-ce.repo
$ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
$ sudo systemctl enable --now docker
```
