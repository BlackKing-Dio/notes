vi /etc/yum.repos.d/CentOS-Base.repo



yum本地源：

[base]

name=CentOS-$releasever - Base

baseurl=file:///mnt

gpgcheck=0

enabled=1



配置其他节点源：

[base] 

name=CentOS-pf

failovermethod=priority 

baseurl=http://192.168.33.214 

gpgcheck=1 

#gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7 

enabled=1



阿里源：

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo





yum clean all   清楚缓存

yum makecache  生成新的缓存



报错：

Delta RPMs disabled because /usr/bin/applydeltarpm not installed.

yum install deltarpm -y



报错：

......Header V4 RSA/SHA1 Signature, key ID a0030e2c: NOKEY

yum install xxxx --nogpgcheck