## 新建测试网卡
进入目录：
cd /etc/sysconfig/network-scripts
准备另一张网卡
cp ifcfg-ens33 ifcfg-ens37
ens33不变（防止网卡故障导致ssh断开）

## 将ens37改为单栈ipv6
vi ifcfg-ens37
先删光！！！
粘贴：
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens37
DEVICE=ens37

最后ifconfig查看