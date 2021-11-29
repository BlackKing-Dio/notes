FakeDns配置：

配置dns.conf.example

A .*reddit.* 8.8.8.8

TXT .* HELLO

AAAA lulz.com 2607:f8b0:4006:807::100e

A .*rebind.* 1.1.1.1 2.2.2.2

A www.baidu.com 1.1.1.1,2.2.2.2,3.3.3.3

AAAA test1.com fe80::5628:844d:7623:7ebd #这里的ipv6地址必须为内部同网段地址，在ipv4能ping通的情况下对应的ipv6地址才可使用

A testrule.test 1.1.1.1,2.2.2.2,3.3.3.3

A roundrobin 1.1.1.1 10%2.2.2.2,3.3.3.3,4.4.4.4

# comment

# A sample PTR entry, note the backwards IP here is required.

PTR 1.0.0.127 localhost

SOA example.com example.com.soa           # SOA rules have a special syntax: SOA [target domain] [config file path]

                                          # see the example.com.soa file for an example and additional comments

开启脚本

python2 fakedns.py -c dns.conf.example



修改DNS服务器（虚拟机上DNS解析服务器一般为网关）

vi /etc/resolv.conf

nameserver xx.x.x.x（fakeDNS开启的设备地址）



dns解析：

用dig解析：

dig www.baidu.com @192.168.64.2（DNS服务器）

dig www.baidu.com @192.168.64.174（DNS服务器）



dig AAAA sixy.ch @192.168.64.174

dig 域名 @dns服务器地址



用ping解析：

测试ipv6能否ping通：

ping -6 -I ens33（虚拟机上要指定网卡） fe80::5628:844d:7623:7ebd

成功后再换成test1.com

ping -6 -I ens33 test1.com





python fakedns1.py -c dns.conf.example1



后台运行：

nohup python fakedns1.py -c white.conf -i 192.168.33.236 >>output.log 2>&1 &