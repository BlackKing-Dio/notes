#1初次使用：
	https://git.iflytek.com/
##注册电脑
	添加ssh　key到git上，操作：网页右上角头像选择　设置---ssh　秘钥----赋值自己　home路径下的~/.ssh/id_rsa.pub　文件内容到文本框。填写标题等，然后提交。　　验证：ssh -T git@git.iflytek.com　　　　　　　　　　　　　若出现：Welcome to GitLab, @gjwang3!　　　则说明ｓｓｈ添加成功。
##新电脑　初次使用
	需要Git全局设置：
		git config --global user.name "gjwang3"
		git config --global user.email "gjwang3@iflytek.com"

		git config --global user.name "wakingwang"
		git config --global user.email "705369516@qq.com"

##新建项目：
	在WEB端　gitlab上操作
	填写名称标示等基本信息，选择属性（私有公开等），不用点（创建readme）对号.然后确定.
	#会出现引导教程


	在自己创建了文件加的情况下：




			cd 你的文件夹名_folder
			git init
			git remote add origin git@git.iflytek.com:gjwang3/你刚创建的工程名字.git    　　#　这步骤每个工作空间只执行一次
			git remote add origin git@10.40.26.77:gjwang3/你刚创建的工程名字.git
			git remote add ftp_server git@10.40.26.77:waking/nano.git
			git add -A           　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　#这个是添加所有的文件到　本地的临时待同步ｇｉｔ区
			git commit -m "你自己对工程/节点的描述"
			git push -u origin master　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　#第一次同步代码到　git　　
			git push -u ftp_server master　　

#常用命令

	git status    #当前工程的状态　　是否有文件要同步　　或者现有分支之类的
	git checkout -b 你的分支名字　　　　　#创建并且移动到分支中
	git checkout  你的分支名字      #移动到这个分区
	git swicth　　你的分支名字 
	git commit -m "你的节点描述"　　　　　#这个必须在push前　　ａｄｄ后执行　　创建分支点
	git push 　　　#提交同步到git代码. 若远程没有此分支，会提醒，再按照提示操作即可。


	若想切换成　master
	git checkout master  
	然后在　git push
	
	git reset --hard HEAD^　　　#当前分支退回到上一个提交　其中  ^ 号代表退回的版本数量　有几个　^　号　就退回几个版本　。
	
	如果想撤销强制退回　	Git误操作 git reset强制回滚 恢复commit方法　，此时解决方法是通过git reflog来查看先前记录并恢复：git reflog会记录所有HEAD的历史，也就是说当你做 reset，checkout等操作的时候，这些操作会被记录在reflog中。
	
	git reflog
	
	然后选择要退回的ｉｄ号　回滚reset：
	
		git reset --hard 98abc5a




​	



#日常操作
	git checkout  你的分支名字       #切换分支
	git add -A                    #全部添加待上传
	git commit -m "你的节点描述"　　　　　　#添加包的描述
	git push                        #上传

##合并
	#步骤
	1.切换到自己的分支
	2.上传自己的代码到自己的分支　　（可以先不用上传到云端）
	3.切换到dev分支　　（要合并的分支）
	4.git fetch   (相当于apt-get update 把远程列表更新下)
	5.git status   （看下当前仓库里代码落后的版本状态）
	6.git pull     (把代码pull下来，同步下所有代码)
	7.git merge -m "merge from gjwang3_dev" gjwang3_dev   (执行合并操作，其中如果m 参数不加的话会提示，默认会有个commet提示，然后如果不填的话会自动生成一个，后边参数应该填写　要合并的分支的名字......总体的意思就是　　把本地当前分支的最新代码　和　本地另一个分支的代码的最新代码　合并，若有冲突会提示)
	8.如果有冲突的情况下：		
							手动修改冲突部分
							git status　  #查看更新状态
							git add -A    #如果需要的话
							git commit -m "你的节点描述"　　　　　　#添加包的描述
	11.git push (origin 分支名　　　　默认当前分支)　　本地合并完后　再将合并完后的最新代码　上传到云端

##删除并新建分支，用于继承开发

   #步骤
   1.从已经合并的dev新下拉新建一个分支，继承现在dev分支的全部代码：　　git checkout -b gjwang3_0603_dev　
   2.删除之前的旧的分支：　　git branch -d gjwang3_dev            (虽然删除，但是仍然可以通过commit的唯一代码　ｈａｓｈ值回滚)　　
   3.这样就可以checkout 新的分支，直接继续开发，开发后再次提交并合并到　dev里，然后再新建分支，再继续开发
   4.若想回滚到删除的哪个分支：　首先确定被删除的分支的节点的commit 的ｈａｓｈ值　如，commit： 51a8acebf56ba02db2f2b0ea583f53c8a1719327，利用前几位51a8acebf56。这样就可以，命令为：　git checkout 51a8ace　　（这样就可把原来的代码找回）







##与团队共同开发代码
### 1.clone 别人代码
	git clone 地址.git
### 2.自己新建分支
	git checkout -b 你的分支名字　　　　　#创建并且移动到分支中

### 3.修改代码
	略
### 4.add
	git add -A                    #全部添加待上传
### 5.commit
	git commit -m "你的节点描述"　　　　　　#添加包的描述
### 6.push
	git push时会有提示到远端，根据提示操作　　注意加参数　git push origin local_branch:remote_branch 或者　　git push --set-upstream origin gjwang-dev

## clone指定分支

git clone -b branchA https://xxx/xxx.git

屏蔽某些资源 .gitcore

回滚：

git reflog

git reset --hard <hash>