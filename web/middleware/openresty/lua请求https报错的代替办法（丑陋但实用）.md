openresty中是有一套请求http/https的方法的：resty.http。https请求需要添加证书文件crt，但是我试了老半天，centos下所有的证书文件都试过去了，找不到钉钉api.dingtalk.com对应的证书。而且还报错缺少ssl模块。
而用curl请求是可以拿到正常结果的，故而产生了一个歪念头。。。。

url = " https://oapi.dingtalk.com/gettoken?appkey="..appkey.."&appsecret="…appsecret
cmd = "echo curl -s \""..url.."\""
t = io.popen(cmd)
_, _, d = string.find(t:read(), ‘{"errcode":0,"access_token":"(%S+)","errmsg’)

哈哈，是不是看上去很怪异？lua调用命令行，然后捕获返回信息，再用正则去解析。
实在没办法了，证书这个问题卡了我很久，到现在也没有解决，所以用了这个办法，还完美规避了resty中一些依赖的缺失问题。

★注意，这里不能直接调用curl哦，因为返回值会抛出一些过程信息，拿到的是一堆无法解析的乱码，必须用echo屏蔽掉这些信息，然后才能上正则。
