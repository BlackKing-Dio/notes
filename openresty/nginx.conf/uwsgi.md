user root;

worker_processes  2;

error_log  logs/error.log;

pid        logs/nginx.pid;

events {

    worker_connections  1024;

    # multi_accept on;

}



http {

    include       /usr/local/openresty/nginx/conf/mime.types;

    access_log    logs/access.log;

    default_type  application/octet-stream;

    server {

       listen 800;

       server_name  0.0.0.0;

       root /root/WAF/web/WAF_web;

       location / {

           #include /usr/local/openresty/nginx/conf/uwsgi_params;

           #uwsgi_pass localhost:8000;

           #uwsgi_param UWSGI_SCRIPT WAF_web.wsgi;

           #uwsgi_param UWSGI_CHDIR /root/WAF/web/WAF_web;

           #uwsgi_read_timeout 2;

           #index  index.html index.htm;

           #root /root/WAF/web/WAF_web;

           proxy_pass http://172.20.146.114:8000;



       }

       location /static {

           expires 30d;

           autoindex on;

           add_header Cache-Control private;

           alias /root/WAF/web/WAF_web/static;

       }

       #location ~* \.(gif|jpg|jpeg|bmp|png|ico|txt|js|css)$

       #{

       #     root /root/WAF/web/WAF_web;

            #echo $1;

       #}

    }

}