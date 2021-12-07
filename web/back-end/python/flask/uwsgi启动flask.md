cd /etc/rc.d/init.d



vi uwsgi.sh



#!/bin/bash

# chkconfig:   2345 10 90

# description:  myservice

uwsgi --http :8000 --chdir /flask_web -w run:app



wq

chkconfig --add uwsgi.sh

chkconfig uwsgi.sh on