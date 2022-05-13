udp包53端口

tcpdump -i ens33 udp port 53 and src net 121.25.33.2

tcpdump -i ens33 tcp port !80 and dst net 192.168.64.182