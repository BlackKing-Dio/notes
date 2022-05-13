post

一般

curl -X POST -d "name=test&&passwd=123" http://192.168.8.1:8088/userInfo/

body

curl -XPOST http://192.168.8.1:8088/userInfo/ -d {"name":"test","passwd":"123"}



windows 指定网卡访问

curl  --interface Realtek PCIe FE Family Controller http://22.22.22.21:3000