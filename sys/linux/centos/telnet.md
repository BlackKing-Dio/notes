cnetos7要支持telnet，需要安装telnet-server xinetd

yum install telnet-server xinetd

systemctl enable xinetd.service

systemctl enable telnet.socket

systemctl start telnet.socket

systemctl start xinetd