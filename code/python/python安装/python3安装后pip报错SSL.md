https://blog.csdn.net/love_cjiajia/article/details/82254371



python3.7安装（解决ssl的问题）



1) 安装准备



yum -y install zlib zlib-devel

yum -y install bzip2 bzip2-devel

yum -y install ncurses ncurses-devel

yum -y install readline readline-devel

yum -y install openssl openssl-devel

yum -y install openssl-static

yum -y install xz lzma xz-devel

yum -y install sqlite sqlite-devel

yum -y install gdbm gdbm-devel

yum -y install tk tk-devel



2) 安装libressl代替openssl-devel

由于系统的openssl是1.0.1的版本，对于python3.7太老了，需要更新为openssl1.0.2或者libressl2.64(不含)以后的版本，所以这里从libressl官网下载libressl源码，编译生成库文件代替系统的openssl1.0.1



进入解压后的目录libressl-2.8.0



运行： ./config --prefix=/usr/local/ssl

make

make intall



mv /usr/bin/openssl /usr/bin/openssl.bak

mv /usr/include/openssl /usr/include/openssl.bak

ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl

ln -s /usr/local/ssl/include/openssl /usr/include/openssl



cd /etc/ld.so.conf.d

新建文件

vim libressl-2.8.0.conf

#将以下行加入文件，并保存

/usr/local/ssl/lib



ldconfig -v #重新加载库文件



验证是否安装完成

[root@testmachine hadoop_software]# openssl version

LibreSSL 2.8.0



3) 安装python3.7

从官网下载python3.7的源码，

解压后进入Python-3.7.0



编译前需要设置环境变量（重要）

export LDFLAGS="-L/usr/local/ssl/lib"

export CPPFLAGS="-I/usr/local/ssl/include"

export PKG_CONFIG_PATH="/usr/local/ssl/lib/pkgconfig"



./configure --prefix=/usr/python --enable-shared CFLAGS=-fPIC



如果ssl版本太旧或者编译前没有设置ssl的环境变量，这里是检测不到ssl的，安装完成后的pip3是无法使用的，这点非常关键！



检测通过后，运行

make

make install



ln -s /usr/python/bin/python3 /usr/bin/python3

ln -s /usr/python/bin/pip3 /usr/bin/pip3



验证python 安装正确



#无法打开python3

cd /etc/ld.so.conf.d

vim python3.conf

ldconfig

#再次编译安装

./configure --prefix=/usr/python --enable-shared CFLAGS=-fPIC --with-openssl=/usr/local/openssl