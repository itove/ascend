# VPN

```
[101156 al@itove ~]$ sudo dpkg -i TopSAP-3.5.2.40.2-x86_64.deb
[sudo] password for al:
Selecting previously unselected package topsap.
(Reading database ... 75097 files and directories currently installed.)
Preparing to unpack TopSAP-3.5.2.40.2-x86_64.deb ...
Unpacking topsap (3.5.2.40.2) ...
Setting up topsap (3.5.2.40.2) ...
install ------- success
[101329 al@itove ~]$ l /opt/TopSAP/
TopSAP-3.5.2.40.2-x86_64.bin
[101334 al@itove ~]$ /opt/TopSAP/TopSAP-3.5.2.40.2-x86_64.bin
Verifying archive integrity...  100%   MD5 checksums are OK. All good.
Uncompressing Install start …  100%
cat: /etc/redhat-release: No such file or directory
TopSAP installation failed
cat /etc/issue
Debian GNU/Linux forky/sid \n \l
cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux forky/sid" NAME="Debian GNU/Linux" VERSION_CODENAME=forky ID=debian HOME_URL="https://www.debian.org/" SUPPORT_URL="https://www.debian.org/support" BUG_REPORT_URL="https://bugs.debian.org/"
```

```
[101415 al@itove ~]$ /opt/TopSAP/TopSAP-3.5.2.40.2-x86_64.bin --confirm
Verifying archive integrity...  100%   MD5 checksums are OK. All good.
About to extract 111380 KB in /tmp/selfgz7960431730 ... Proceed ? [Y/n] y
Uncompressing Install start …  100%
OK to execute: ./sv_install.sh   ? [Y/n]
```

```
[101508 al@itove ~]$ cp -a /tmp/selfgz7960431730 topvpn
[101529 al@itove ~]$ l topvpn/
centos  common  kylin  NeoKylin  sv_install.sh  ubuntu  uos
```

Edit `topvpn/sv_install.sh`

```diff
-v=`cat /etc/issue |grep Ubuntu|grep -v grep|wc -l`
+v=1
```

```
[101634 al@itove ~]$ topvpn/sv_install.sh
[sudo] password for al:
TopSAP successfully installed in Ubuntu system
```
