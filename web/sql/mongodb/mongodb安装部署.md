# ubuntu 18.04
## 导入公钥
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
## 创建源列表文件MongoDB
echo "deb [ arch=amd64 ] Index of ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
## 安装依赖
sudo apt install libcurl3
# 安装依赖包
sudo apt-get install libcurl4 openssl
sudo apt update
sudo apt install mongodb-org
## 开启mongo
sudo systemctl start mongod.service
## 开机自启
sudo systemctl enable mongod

# ubuntu 20.04
## 安装gnupg软件包
sudo apt-get install gnupg
## 导入包管理系统使用的公钥
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
## 添加MongoDB存储库
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
## 更新存储库
sudo apt-get update
## 使用以下命令安装MongoDB
sudo apt install mongodb-org
## 开启mongo
sudo systemctl start mongod.service
## 开机自启
sudo systemctl enable mongod


# 设置远程连接
##修改配置文件
sudo vim /etc/mongod.conf
net:
  port: 27017
  bindIp: 0.0.0.0

security:
  authorization: enabled

## 远程连接
加密方式选择 SCRAM-SHA-1

## 解决无法启动的问题
查看 mongodb 状态 sudo systemctl status mongod

sudo mongod --repair --dbpath /var/lib/mongodb
chown -R mongodb:mongodb /var/lib/mongodb
chown mongodb:mongodb /tmp/mongodb-27017.sock
sudo systemctl restart mongod

再次查看 mongodb 状态 sudo systemctl status mongod