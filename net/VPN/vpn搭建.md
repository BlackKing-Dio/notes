# 警告
<b>私自架设VPN违反国家信息管理条例，网警对这块查处力度很大，基本上VPN通道一打开，半天内就会被永久封禁服务器ip
如无必要，不要自己搭建，请购买商业VPN，贵是贵了点，但是比浪费服务器带宽的钱要合算
2021.11.15日，VPN通道不知道是在物理还是网络层被检测到了，服务器ip被Chinese Great Wall永久拦截</b>

## 服务端配置
sudo apt-get install shadowsocks
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
#### 新建配置文件
mkdir -p ~/.vpn
vi ~/.vpn/ss.json
{
"server":"0.0.0.0",
"server_port":6317,
"local_address": "127.0.0.1",
"local_port":1080,
"password":"helloworld",
"method":"rc4-md5",
"timeout":300,
"fast_open": false
}
#### 开启BBR
sudo modprobe tcp_bbr
echo "tcp_bbr" | sudo tee --append /etc/modules-load.d/modules.conf
echo "net.core.default_qdisc=fq" | sudo tee --append /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee --append /etc/sysctl.conf
sudo sysctl -p
#### 启动
ssserver -c ss.json -d start  ##后台启动 
ssserver -c ~/.vpn/ss.json start   ##命令行启动


## 客户端配置
sudo apt-get install shadowsocks
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

mkdir -p ~/.vpn
vi ~/.vpn/cc.json
{
"server":"xx.xx.xx.xx",
"server_port":6317,
"local_address": "127.0.0.1",
"local_port":1080,
"password":"helloworld",
"method":"rc4-md5", 
"timeout":300,
"fast_open": false
} 

#### ubuntu20
sudo ss-local -c ~/.vpn/cc.json start
#### ubuntu18
sudo sslocal -c ~/.vpn/cc.json start

## 云服务器安全组规则配置
1.开放所有DNS端口（TCP/UDP）
2.开放一个特定范围的端口区域的TCP/UDP（比如17001-17999）

## 关于加密方式
如果系统不支持该加密方式，并且插件安装失败，可以选择更换别的加密方式
aes-256-cfb，rc4-md5
