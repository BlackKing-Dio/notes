
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8000
## 查看服务信息
rosservice info /get_battery_state

Node: /base_driver
URI: rosrpc://d8-c0-a6-d0-75-e7:39507
Type: aicar_controller/GetBatteryInfo
Args:xxx


import rospy
from aicar_controller.srv import *

tcp_server_init_node=rospy.init_node('tcp_server_ros_node')

c = rospy.ServiceProxy("/get_battery_state",GetBatteryInfo)
c(xxx)

### 有参数
aa=MoveByRequest()
aa.vel.linear.x = 0.5
aa.time = 1
ddd = c(aa)
ddd