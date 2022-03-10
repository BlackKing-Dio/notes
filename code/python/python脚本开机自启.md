# 1.自建服务脚本
```shell
sudo vim /etc/init.d

#!/bin/bash
# chkconfig:   2345 10 90
# description:  scan_switch
filepath="/root/software/flask/scan_arp_mac.py"
start(){
    nohup /usr/local/bin/python3 $filepath > scan.log 2>&1 &
    echo 'scan_switch service OK'
}
stop(){
    serverpid=`ps -aux|grep "$filepath"|grep -v grep|awk '{print $2}'`
    kill -9 $serverpid
    echo 'scan_switch stop OK'
}
restart(){
    stop
    echo 'scan_switch stop OK'
    start
    echo 'scan_switch service OK'
}
case $1 in
    start)
    start
    ;;
    stop)
    stop
    ;;
    restart)
    restart
    ;;
    *)
    start
esac
```

# 2.只配置开机
```shell
将需要执行的shell文件放入
/etc/profile.d/下
```