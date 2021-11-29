
编译报错：Failed to build these modules: _ctypes

安装依赖:

yum install libffi-devel -y

重新编译





新节点环境：

yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make





python2 安装pip

yum install python-pip



安装Mysqldb:

python2

pip install Mysql-python

报错：EnvironmentError: mysql_config not found

解决：

yum install python-devel mysql-devel

pip install Mysql-python





python3

pip3 install mysqlclient

报错：OSError: mysql_config not found

yum install python3-devel mysql-devel



pip3 install mysqlclient

报错：Error: MariaDB-common conflicts with 1:mariadb-libs-5.5.64-1.el7.x86_64

          Error: Package: 1:mariadb-devel-5.5.64-1.el7.x86_64 (base)

