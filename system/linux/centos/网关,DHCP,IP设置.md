/etc/sysconfig/network-scripts/ifcfg-ens33



TYPE=Ethernet

PROXY_METHOD=none

BROWSER_ONLY=no

BOOTPROTO=static  #IP自定义需要设置DHCP为静态，自动获取IP则改为dhcp

IPADDR=192.168.60.185  #本地自定义IP

NETMASK=255.255.255.0  #掩码

GATEWAY=192.168.60.183 #网关

DEFROUTE=yes

IPV4_FAILURE_FATAL=no

IPV6INIT=yes

IPV6_AUTOCONF=yes

IPV6_DEFROUTE=yes

IPV6_FAILURE_FATAL=no

IPV6_ADDR_GEN_MODE=stable-privacy

NAME=ens33

UUID=11189dfe-6a94-4c4e-9b50-0baba161d370

DEVICE=ens33

ONBOOT=yes

IPV4_ROUTE_METRIC = 99  #路由metric值

service network restart