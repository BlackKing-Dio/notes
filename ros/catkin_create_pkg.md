```
cd */catkin_ws/src

catkin_create_pkg  [depend1] [depend2] [depend3]
例：catkin_create_pkg beginner_tutorials std_msgs rospy roscpp

查看一级依赖：
rospack depends1 beginner_tutorials
查看多层依赖：
rospack depends beginner_tutorials

添加环境变量：
export ROS_PACKAGE_PATH=~/catkin_ws/src:$ROS_PACKAGE_PATH
```