openssl生成nginx证书





https标准配置：

http{

      listen 443 ssl;

      server_name  localhost;

      ssl on;

      ssl_certificate     ../SSL/2247831_baike.yj.gov.cn.pem;

      #ssl证书key位置

      ssl_certificate_key  ../SSL/2247831_baike.yj.gov.cn.key;

      ssl_session_timeout 5m;

      #ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

      #数字签名，此处使用MD5

      #ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;

      ssl_ciphers  HIGH:!aNULL:!MD5;

      ssl_prefer_server_ciphers  on;

       location / {

           root /root/yongjiabaike;

           index index.dd1.html;

       }

       location ^~ /home/ {

           #rewrite ^/(.*)$ http://192.168.20.111:807/index.dd1.html permanent;

           #rewrite ^/(.*)$ http://61.164.96.198:6080 permanent;

           rewrite ^/(.*)$ https://61.164.96.198:8010 permanent;

           #proxy_pass http://192.168.20.111:807 ;

       }

       location /test {

           lua_need_request_body on ;

           default_type 'text/plain' ;

           content_by_lua_file /root/yongjiabaike/lua/t6.lua ;

       }

       #location /DCYUAWYVQVU/ {

       #    rewrite ^/(.*)$ http://61.164.96.198:6080/binding.html permanent;

       #}

       location /DCYUAWYVQVUDACQTYM {

           proxy_pass https://61.164.96.198/home/Pubindex.html;

       }

       location /aims2 {

           lua_need_request_body on ;

           default_type 'text/plain';

           content_by_lua 'ngx.say("verification failed")';

       }

       error_page  500 502 503 504  /aims2;



https 强制改端口（此方法由于使得https的默认端口被修改，一些设备，比如苹果可能不会信任该证书）：

http{

      listen 8010 ssl;

      server_name  localhost;

      ssl on;

      ssl_certificate     ../SSL/2247831_baike.yj.gov.cn.pem;

      #ssl证书key位置

      ssl_certificate_key  ../SSL/2247831_baike.yj.gov.cn.key;

      ssl_session_timeout 5m;

      ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

      #数字签名，此处使用MD5

      #ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;

      ssl_ciphers  HIGH:!aNULL:!MD5;

      ssl_prefer_server_ciphers  on;

       location / {

           root /root/yongjiabaike;

           index index.dd1.html;

       }

       location ^~ /home/ {

           #rewrite ^/(.*)$ http://192.168.20.111:807/index.dd1.html permanent;

           #rewrite ^/(.*)$ http://61.164.96.198:6080 permanent;

           rewrite ^/(.*)$ https://61.164.96.198:8010 permanent;

           #proxy_pass http://192.168.20.111:807 ;

       }

       location /test {

           lua_need_request_body on ;

           default_type 'text/plain' ;

           content_by_lua_file /root/yongjiabaike/lua/t6.lua ;

       }

       #location /DCYUAWYVQVU/ {

       #    rewrite ^/(.*)$ http://61.164.96.198:6080/binding.html permanent;

       #}

       location /DCYUAWYVQVUDACQTYM {

           proxy_pass https://61.164.96.198/home/Pubindex.html;

       }

       location /aims2 {

           lua_need_request_body on ;

           default_type 'text/plain';

           content_by_lua 'ngx.say("verification failed")';

       }

       error_page  500 502 503 504  /aims2;