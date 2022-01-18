## scp
### scp ipv6传输
scp breton@\[240e:46d:5f01:4971:d1d0:1938:33e2:a5ec]:/home/breton/breton_project/jetson_enc_dec_camera/src.tar.gz .
### scp 指定端口
scp -P 6001 breton@58.34.208.243:/home/breton/breton_project/jetson_enc_dec_camera/src.tar.gz .

## 根据特殊字符杀死进程
sudo kill -9 `sudo ps -ef|grep cp_server_for_vehicle_cmd|grep -v color= |awk '{print $2}'`