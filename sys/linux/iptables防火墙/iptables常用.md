## 默认出口关闭
iptables -P OUTPUT DROP
iptables -A OUTPUT -d 192.168.60.110 -j ACCEPT

## 直接越过防火墙（可用于实现白名单功能）
iptables -t raw -A PREROUTING -s 192.168.6.2  -j NOTRACK

## 指定端口转发
iptables -t nat -I PREROUTING -p tcp -s 192.168.76.0/24 -m multiport --dport 80,8080 -j DNAT --to-destination 22.22.22.21:3000

## 映射全部tcp转发
iptables -t nat -I PREROUTING -p tcp  -j DNAT --to-destination 22.22.22.21:3000

## 放行ssh端口
iptables -t raw -A PREROUTING -p tcp -m multiport --dport 22,3306,3333,3000,3001 -j NOTRACK

## 放行114.114.114.114：
iptables -t raw -A PREROUTING -d 114.114.114.114 -j NOTRACK
iptables -A FORWARD -d 114.114.114.114 -j  ACCEPT

## 白名单规则
iptables -t raw -A PREROUTING -s xx.xx.xx.xx/24 -j NOTRACK

## icmp白名单
iptables -A FORWARD -p icmp -j DROP
iptables -I FORWARD -s 192.168.76.199 -p icmp -j ACCEPT 
iptables -D FORWARD -s 192.168.76.199 -p icmp -j ACCEPT

## 钉钉地址直接过
iptables -t raw -A PREROUTING -s xx.xx.xx.xx/24 -j NOTRACK

## 放行3333端口：
iptables -A INPUT -p tcp --dport  3333 -j ACCEPT