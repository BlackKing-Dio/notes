清华镜像
 -i https://pypi.tuna.tsinghua.edu.cn/simple

永久改变镜像源
#### windows
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

#### linux
mkdir ~/.pip
vim .pip/pip.conf
```conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host = pypi.tuna.tsinghua.edu.cn
```