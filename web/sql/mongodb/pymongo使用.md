```python
from pymongo import MongoClient

## 定义连接
client = MongoClient('localhost',27017)
## 连接数据库
collection = client['test']['t1']

# find_one查询数据
for x in collection.find({},{ "_id": 0, "name": 1, "alexa": 1 }):
    print(x)

#insert_one添加一条数据
ret = collection.insert_one({"name":"test10010","info":"aaaaac"})
#insert_many添加多条数据
item_list = [{"name":"123","info":"sqad"},{"name":"qwe","info":"xscq"}]
t = collection.insert_many(item_list)
#update_one更新一条数据
collection.update_one({"name":"test10005"},{"$set":{"ppp":"new_test10005"}})
#update_many更新全部数据
collection.update_many({"name":"test10005"},{"$set":{"ppp":"new_test10005"}})
#delete_one删除一条数据
collection.delete_one({"name":"test10010"})
#delete_many删除所有满足条件的数据
collection.delete_many({"name":"test10010"})
```