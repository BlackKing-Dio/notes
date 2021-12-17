插入文档
    db.COLLECTION_NAME.insert(document)
或
    db.COLLECTION_NAME.save(document)


只更新第一条记录：
    db.col.update( { "count" : { $gt : 1 } } , { $set : { "test2" : "OK"} } );
全部更新：
    db.col.update( { "count" : { $gt : 3 } } , { $set : { "test2" : "OK"} },false,true );


删除文档
    db.inventory.deleteMany({ status : "A" })