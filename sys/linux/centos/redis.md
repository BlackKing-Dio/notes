yum install epel-release

 然后就可以安装redis了

 

yum install -y  redis

安装完成以后配置文件/etc/redis.conf

 

启动redis服务端

 

redis-server /etc/redis.conf

查看是否启动

 

ps -ef|grep "redis"

启动客户端

 

redis-cli

简单使用

 

set name "xiaoming"

get name



hget "sw_id" key

