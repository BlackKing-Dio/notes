与git服务器不通讯：

检查ssh密钥是否有问题：ssh -T git@git.iflytek.com 

如果没有welcome.....，按ssh设置来做



无法推送(git push 报错)

（先确保已经切换分支 git checkout -b jfhuang2_dev）

1.先指定分支pull整合代码：

git pull origin jfhuang2_dev

2.git add -A;git commit -m "...."

3.git push



如果不能解决

git push origin --delete jfhuang2_dev

git branch -D jfhuang2_dev

然后重来



常用：

　　1 先切换到别的分支: git checkout dev20180927

　　2 删除本地分支： git branch -d dev20181018

　　3 如果删除不了可以强制删除，git branch -D dev20181018

　　4 有必要的情况下，删除远程分支**(慎用)**：git push origin --delete dev20181018

　　5 在从公用的仓库fetch代码：git fetch origin dev20181018:dev20181018

　　6 然后切换分支即可：git checkout dev20181018