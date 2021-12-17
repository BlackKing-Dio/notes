vim /etc/init.d/uwsgi



#!/bin/bash

# chkconfig: - 85 15

uwsgi=/root/hjf/cams/ENV/bin/uwsgi

hello_conf=/root/hjf/cams/ENV/conf/uwsgi/uwsgi.ini



case $1 in

    start)

        echo -n "Starting uWsgi"

        nohup $uwsgi -i /root/hjf/cams/ENV/conf/uwsgi/uwsgi.ini >/root/hjf/cams/ENV/log/uwsgi.log 2>&1 &

        echo " done"

    ;;



    stop)

        echo -n "Stopping uWsgi"

        killall -9 uwsgi

        echo " done"

    ;;



    restart)

        $0 stop

        $0 start

    ;;



    show)

        ps -ef|grep uwsgi

    ;;



    *)

        echo -n "Usage: $0 {start|restart|stop|show}"

    ;;



esac