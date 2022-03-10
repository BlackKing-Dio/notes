## 进入docker容器命令行
sudo docker exec -it 4c6103ee0252 /bin/bash

## 复制文件并解压
software/
    weserverforlinux.tar.gz
data/
    30mDem.rar
    Global.rar
    GlobalMercator.rar

解压后修改配置文件
vim /root/software/weserverforlinux/weserverx64/WeServerConfig.ini
```ini
[APACHE]
PORT=80

[CACHE]
ACDEM_DIR=/data/30mDem
IMAGE_DIR=/data/Global/Satellite
LABEL_DIR=

[CESIUM]
DOMAIN=http://127.0.0.1

[FORMAT]
DEM_FORMAT=TERRAIN
```

## 安装依赖 
apt install libglib2.0-0
apt install libidn11-dev
apt install libkrb5-dev

## 启动
cd /root/software/weserverforlinux/weserverx64
./start_con.sh

## 访问瓦片
http://192.168.30.201:8000/WeServer/wmts/1.0.0/acimage/default/wgs84/1/1/2.jpg

## 访问地形
## 地形文件 terrain
http://192.168.30.201:8000/WeServer/tms/1.0.0/acdem@wgs84_c/0/0/0.terrain

## layer
http://192.168.30.201:8000/cesium/layer.json

## 配置到cesium
http://192.168.30.201:8000/cesium

## 修改配置
vim /weserver/weserverx64/apache/htdocs/cesium/layer.json
```json
{
    "author":"lmw",
    "format":"heightmap-1.0",
    "version":"1.0.0",
    "scheme":"tms",
    "tiles":["http://172.17.0.2:80/WeServer/tms/1.0.0/acdem@wgs84_c/{z}/{x}/{y}.terrain"]
}
```

vim /weserver/weserverx64/mapcache/mapcache_cfg.xml
```xml
    <cache type="dat" name="ac_dem">
        <dir>/data/30mDem</dir>
        <recursive>TRUE</recursive>
    </cache>
```

## 其他地址
http://192.168.30.201:8000/WeServer/tms/1.0.0/acdem
http://192.168.30.201:8000/WeServer/wmts?service=wmts&request=getcapabilities