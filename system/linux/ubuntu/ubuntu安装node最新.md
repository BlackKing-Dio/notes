wget http://nodejs.cn/download/

cd /usr/local
sudo mkdir node && cd node
# 解压，注意有个点
sudo mv /home/karl/Downloads/node-v14.10.1-linux-x64/* .

# 创建链接
sudo ln -s /usr/local/node/bin/node /usr/local/bin/node
sudo ln -s /usr/local/node/bin/npm  /usr/local/bin/npm
sudo ln -s /usr/local/node/bin/npx  /usr/local/bin/npx