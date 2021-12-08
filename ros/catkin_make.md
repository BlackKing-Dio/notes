```
对于python2.7:
catkin_make

对于python3
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3

catkin_pkg找不到：
环境变量：
export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages

使用工作空间：
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
重载工作空间：
cd ~/catkin_ws
source devel/setup.bash
bash

检查工作空间：
echo $ROS_PACKEAGE_PATH

自动加载工作空间
vi ~/.bashrc
source /opt/ros/kinetic/setup.bash
source /home/yau/catkin_ws/devel/setup.bash
```