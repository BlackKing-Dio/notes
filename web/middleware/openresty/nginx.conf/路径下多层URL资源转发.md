
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
      listen 443 ssl;
      #listen 8010 ssl;
      server_name  baike.yj.gov.cn;
      ssl on;
      #server_tokens off;
      #fastcgi_param HTTPS  on;
      #fastcgi_param HTTP_SCHEME https;
      #root grjf_front;
      ssl_certificate     ../SSL/2247831_baike.yj.gov.cn.pem;
      #ssl证书key位置
      ssl_certificate_key  ../SSL/2247831_baike.yj.gov.cn.key;
      ssl_session_timeout 5m;
      #ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
      #数字签名，此处使用MD5
      ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
      #ssl_ciphers  HIGH:!aNULL:!MD5;
      ssl_prefer_server_ciphers  on;
      proxy_pass_request_headers on;
      proxy_pass_request_body on;
       location / {
           root /root/yongjiabaike;
           #index index.dd1.html;
           #index baike.index.html;
           index index.html;
       }
       #location /baike.index.html {
           #proxy_pass https://61.164.96.198/home/Pubindex.html;
           #proxy_pass http://10.37.252.151/home/Pubindex.html;
           root /root/yongjiabaike;
           #rewrite ^/(.*)$  https://baike.yj.gov.cn/baike.index.html;
       #}
       location /webdoc {
           proxy_pass https://10.37.252.151/webdoc;
           proxy_http_version 1.1;
           proxy_set_header Connection "";
           proxy_set_header Host  $host;
           proxy_set_header X-Real_IP $remote_addr;
           proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       location /view {
           proxy_pass https://10.37.252.151/view;
           #proxy_http_version 1.1;
           #proxy_set_header Connection "";
           #proxy_set_header Host  $host;
           #proxy_set_header X-Real_IP $remote_addr;
           #proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
           #proxy_ssl_verify   off;
       }
       location /webtype {
           proxy_pass https://10.37.252.151/webtype;
           proxy_http_version 1.1;
           proxy_set_header Connection "";
           proxy_set_header Host  $host;
           proxy_set_header X-Real_IP $remote_addr;
           proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       location /websearch {
           proxy_pass https://10.37.252.151/websearch;
           proxy_http_version 1.1;
           proxy_set_header Connection "";
           proxy_set_header Host  $host;
           proxy_set_header X-Real_IP $remote_addr;
           proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       location /text {
           proxy_pass https://10.37.252.151/text;
           proxy_http_version 1.1;
           proxy_set_header Connection "";
           proxy_set_header Host  $host;
           proxy_set_header X-Real_IP $remote_addr;
           proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       location /actionImg {
           proxy_pass https://10.37.252.151/actionImg;
           proxy_http_version 1.1;
           proxy_set_header Connection "";
           proxy_set_header Host  $host;
           proxy_set_header X-Real_IP $remote_addr;
           proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       location ^~ /home/ {
           rewrite ^/(.*)$ https://baike.yj.gov.cn/baike.index.html permanent;
           #rewrite ^/(.*)$ https://baike.yj.gov.cn permanent;
           #rewrite ^/(.*)$ https://61.164.96.197 permanent;
           #proxy_pass http://10.37.252.151/home/Pubindex.html;
           #proxy_pass http://10.37.252.151;
           #proxy_http_version 1.1;
           #proxy_set_header Connection "";
           #proxy_set_header Host  $host;
           #proxy_set_header X-Real_IP $remote_addr;
           #proxy_set_header X_Forwarded_For $proxy_add_x_forwarded_for;
       }
       #location /test {
       #    lua_need_request_body on ;
       #    default_type 'text/plain' ;
       #    content_by_lua_file /root/yongjiabaike/lua/t6.lua ;
       #}
       #location /DCYUAWYVQVU/ {
       #    rewrite ^/(.*)$ http://61.164.96.198:6080/binding.html permanent;
       #}
       #location /DCYUAWYVQVUDACQTYM {
           #proxy_set_header Host $host;
           #proxy_set_header X-Real-Ip $remote_addr;
           #proxy_set_header X-Forwarded-For $remote_addr;
           #root /root/yongjiabaike;
           #proxy_pass https://61.164.96.198/home/Pubindex.html;
           #proxy_pass https://baike.yj.gov.cn/home/Pubindex.html;
           #proxy_pass http://10.37.253.19:9001/wage/index.html;
           #proxy_pass http://61.164.96.205:8888/wage/index.html;
           #proxy_pass https://db.yj.gov.cn/yjdb/wage/index.html;
           #rewrite ^(.*) https://db.yj.gov.cn/$1 permanent;
       #}
       location /aims2 {
           lua_need_request_body on ;
           default_type 'text/plain';
           content_by_lua 'ngx.say("verification failed")';
       }
       #location /sss/ {
       #    proxy_pass http://61.164.96.205:8888/;
       #     proxy_set_header Host $http_host;
       # proxy_set_header Upgrade $http_upgrade;
       # proxy_set_header Connection "upgrade";
  
       # proxy_set_header X-Real-IP $remote_addr;
       # proxy_set_header REMOTE-HOST $remote_addr;
       # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       #}
       #location /ttt/ {
       #    proxy_pass http://61.164.96.205:8888/;
       #    proxy_set_header X-Real-IP $remote_addr;
           #proxy_method POST;
       #}
        location /api/sjmlpt/ {
      client_max_body_size    100m;
      proxy_pass http://10.37.253.24:9033/api/sjmlpt/;
      proxy_cookie_path /api/sjmlpt/ /api/sjmlpt/;
      proxy_set_header Host $host:$server_port;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header REMOTE-HOST $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
    
    location /api/sjjhpt/ {
      client_max_body_size    100m;
      proxy_pass http://10.37.253.24:38080/api/sjjhpt/;
      #proxy_pass http://172.16.2.141:38080/api/sjjhpt/;
      proxy_cookie_path /api/sjjhpt/ /api/sjjhpt/;
      proxy_set_header Host $host:$server_port;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header REMOTE-HOST $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
    
    location /api/filesys/ {
          client_max_body_size    100m;
          proxy_pass http://10.37.253.20:19000/api/filesys/;
          #proxy_pass http://172.16.2.141:19000/api/filesys/;
          proxy_cookie_path /api/filesys/ /api/filesys/;
          proxy_set_header Host $host:$server_port;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header REMOTE-HOST $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
    
    location /api/zygkpt/ {
      client_max_body_size    100m;
      proxy_pass http://10.37.253.24:9011/api/zygkpt/;
      proxy_cookie_path /api/zygkpt/ /api/zygkpt/;
      proxy_set_header Host $host:$server_port;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header REMOTE-HOST $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
    
    location /api/sos/ {
      client_max_body_size    100m;
      proxy_pass http://10.37.253.24:9022/api/sos/;
      proxy_cookie_path /api/sos/ /api/sos/;
      proxy_set_header Host $host:$server_port;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header REMOTE-HOST $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
       #location ~ .*\.(js|css)$ {
       #    proxy_pass http://61.164.96.205:8888;
       #}
       #location ~ .*\.(js|css|ttf|woff)$ {
       #      proxy_pass http://61.164.96.205:8888;
       #}
       #location ~* \.(gif|jpg|jpeg|bmp|png|ico|txt|js|css)$ 
       #{    
       #     root /root/yongjiabaike;
            #echo $1;
       #}
       error_page   404 500 502 503 504  /aims2;
    }
}
