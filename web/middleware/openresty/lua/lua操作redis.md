一般情况下：

local redis = require("resty.redis")



local red = redis:new()

red:set_timeout(1000)



local rip = "127.0.0.1"

local rport = 6377

local ok, err = red:connect(rip, rport)

if not ok then

    return close_redis(red)

end



local res, err = red:auth("123123")

if not res then

    return

end



调用：lastime,d = red:hmget("iphash",ip)







特别的：

user root;

worker_processes  10;



error_log  logs/error.log;

pid        logs/nginx.pid;



events {

    worker_connections  1024;

    # multi_accept on;

}

http {

    include  /usr/local/openresty/nginx/conf/mime.types;

    access_log  logs/access.log;

    default_type  application/octet-stream;

    lua_shared_dict limit 50m;

    lua_package_path "/usr/local/openresty/nginx/conf/waf/?.lua;;";

    init_by_lua_file "/usr/local/openresty/nginx/conf/waf/init.lua";

    access_by_lua_file "/usr/local/openresty/nginx/conf/waf/access.lua";

    server {

        listen       807;

        server_name  localhost;

        location /hello {

                default_type 'text/plain';

                content_by_lua 'ngx.say("hello,lua")';

        }

        location / {

                default_type 'text/plain';

                content_by_lua 'ngx.say("hello")';

        }

    }

}



以上情况不能直接调用，init_by_lua_file是不支持加载redis模块的

function get_check(tag)

  cmd = 'redis-cli -p 6379  -a 123123 -n 0 hget  "config_firewall" "'..tag..'"'

  local t = io.popen(cmd)

  local k = t:read("*all")

  local m = string.gsub(k,'\n','')

  --local m = string.sub(k, 1, -2) 

  return m

end

调用：

local config_white_ip_check = get_check("config_white_ip_check")