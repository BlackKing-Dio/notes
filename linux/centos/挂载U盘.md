fdisk -l #查看U盘名

mount /dev/xxx(u盘名) /mnt



yum本地源：



vi /etc/yum.repos.d/CentOS-Base.repo



# CentOS-Base.repo

#

# The mirror system uses the connecting IP address of the client and the

# update status of each mirror to pick mirrors that are updated to and

# geographically close to the client.  You should use this for CentOS updates

# unless you are manually picking other mirrors.

#

# If the mirrorlist= does not work for you, as a fall back you can try the

# remarked out baseurl= line instead.

#

#



[base]

name=CentOS-$releasever - Base

baseurl=file:///mnt

gpgcheck=0

enabled=1



yum clean all



#完成