#切换分支
git checkout -B master
#查看分支
git branch
#切换分支
git checkout -B hjf
#查看分支
git branch

下拉：
git pull origin master
上传：
git push origin master


本地与远程仓库不同步，想要强制覆盖下拉,请谨慎操作：
git pull -f origin master

本地与远程仓库不同步，想要强制覆盖上传,请谨慎操作：
git push -f origin master
