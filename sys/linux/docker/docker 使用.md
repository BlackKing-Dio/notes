## 查看本地所有镜像
sudo docker images

## 查看ubuntu镜像
sudo docker images ubuntu

## 拉取ubuntu镜像
sudo docker pull ubuntu

## 运行容器（每个镜像只运行一次）
## 
sudo docker run -itd --name ubuntu-test ubuntu
## 
sudo docker run -P -d ubuntu:latest
##
sudo docker run -p 8000:80 -it gis /bin/bash

## 查看正在运行的容器
sudo docker ps

## 启动容器
sudo docker start <CONTAINER ID>

## 进入容器
sudo docker attach <CONTAINER ID>
或者
sudo docker exec -it <CONTAINER ID> /bin/bash

## 查看容器详细信息
sudo docker inspect <CONTAINER ID>

## docker仓库管理
sudo docker rm <CONTAINER ID>

## docker文件管理
sudo docker cp 本地文件的路径 <CONTAINER ID>:<docker容器内的路径>

## 为镜像改名
sudo docker tag <IMAGE_ID> <REPOSITORY>

## 保存容器修改
docker commit <CONTAINER ID> <REPOSITORY>