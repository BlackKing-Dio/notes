## 登陆
mongo
db.auth("xxx","xxxxxxxxxx")

## 查看当前数据库状态
db.stats()

## 用户管理
### 创建用户
db.createUser({
    user:<user>
    pwd:<passwd>
    roles[{role:<role>.db:<db>}]
})
### 创建超级管理员
db.createUser(
  {
    user: "admin",
    pwd:"你的密码",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)  

#### <role>角色
数据库用户角色：read、readWrite; 
数据库管理角色：dbAdmin、dbOwner、userAdmin；
集群管理角色：clusterAdmin、clusterManager、clusterMonitor、hostManager； 
备份恢复角色：backup、restore； 
所有数据库角色：readAnyDatabase、readWriteAnyDatabase、userAdminAnyDatabase、dbAdminAnyDatabase 
超级用户角色：root

#### 角色说明
read：允许用户读取指定数据库
readWrite：允许用户读写指定数据库
dbAdmin：允许用户在指定数据库中执行管理函数，如索引创建、删除，查看统计或访问system.profile
userAdmin：允许用户向system.users集合写入，可以找指定数据库里创建、删除和管理用户
clusterAdmin：只在admin数据库中可用，赋予用户所有分片和复制集相关函数的管理权限。
readAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读权限
readWriteAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读写权限
userAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的userAdmin权限
dbAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的dbAdmin权限。
root：只在admin数据库中可用。超级账号，超级权限

### 查看用户
use admin
db.auth("root","123")
db.system.users.find()

### 删除用户
db.system.users.remove({user:"mofang"})

### 修改密码
db.changeUserPassword(“账户名”, “新密码”)

## 开启账户认证
sudo vim /etc/mongodb.conf
#### 找到22行附近的 auth=true，去掉左边注释符号(#)
auth=true
:wq
#### 重启mongdb，配置生效
sudo systemctl restart mongod
