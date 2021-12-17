## 备份数据库
mongodump --db 库名称 --out 备份存放路径

# 执行恢复库
mongorestore --db 库名称 备份存放路径

## 导出数据
mongodump --host 192.168.1.1 --port 27020 --username root --password mypwd --authenticationDatabase admin --db user-data --out /home/res/xxx

## 导入数据
mongorestore --host 192.168.2.2 --port 27019 --username root --password mypwd --authenticatio
