flask

uwsgi.ini:



[uwsgi]

master = true

http = :3333

chdir = /root/software/flask

wsgi-file= /root/software/flask/run.py

callable = app

processes = 4

threads = 2

buffer-size = 32768

pidfile = /root/software/uwsgi.pid

#daemonize = /root/software/uwsgi.log

==============================



django

uwsgi.ini:



[uwsgi]

master = true

http = :8000

chdir = /xx/xx/django

wsgi-file= /xx/xx/web/wsgi.py

processes = 4

threads = 2

buffer-size = 32768

pidfile = /root/software/uwsgi.pid

#daemonize = /root/software/uwsgi.log

===============================



开启服务：

/usr/local/bin/uwsgi --ini /root/software/uwsgi.ini

后台开启服务：

/usr/local/bin/uwsgi -d --ini /root/software/uwsgi.ini

重启：

/usr/local/bin/uwsgi --restart /root/software/uwsgi.pid

停止：

/usr/local/bin/uwsgi --stop /root/software/uwsgi.pid

