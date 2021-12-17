sed替换

sed -i 's/app\.users\.model/cams_model/g' /root/software/flask/app/__init__.py



grep 批量搜索/显示匹配文件 （-s -H）

for i in `find $PWD`; do grep -s -H 'app.users.model' $i; done