
# 子模块的添加

添加子模块非常简单，命令如下：
```shell
git submodule add <url> <path>
```
> 举例说明: git submodule add git@192.168.1.201:waking/ros-g29-force-feedback.git wheel_control

git submodule add git@192.168.1.201:waking/jetson_enc_dec_camera.git apps/camera/modules/jetson_enc_dec_camera

其中，url为子模块的路径，path为该子模块存储的目录路径。

执行成功后，git status会看到项目中修改了.gitmodules，并增加了一个新文件（为刚刚添加的路径）
```shell
git diff --cached  #查看修改内容可以看到增加了子模块，并且新文件下为子模块的提交hash摘要
```
git commit提交即完成子模块的添加
子模块的使用

克隆项目后，默认子模块目录下无任何内容。需要在项目根目录执行如下命令完成子模块的下载：
```shell
git submodule init
git submodule update
```

或：
```shell
git submodule update --init --recursive
```

执行后，子模块目录下就有了源码，再执行相应的makefile即可。
子模块的更新

子模块的维护者提交了更新后，使用子模块的项目必须手动更新才能包含最新的提交。

在项目中，进入到子模块目录下，执行 git pull更新，查看git log查看相应提交。

完成后返回到项目目录，可以看到子模块有待提交的更新，使用git add，提交即可。
删除子模块

有时子模块的项目维护地址发生了变化，或者需要替换子模块，就需要删除原有的子模块。

删除子模块较复杂，步骤如下：

```shell
rm -rf 子模块目录 删除子模块目录及源码
vi .gitmodules 删除项目目录下.gitmodules文件中子模块相关条目
vi .git/config 删除配置项中子模块相关条目
rm .git/module/* 删除模块下的子模块目录，每个子模块对应一个目录，注意只删除对应的子模块目录即可
```

执行完成后，再执行添加子模块命令即可，如果仍然报错，执行如下：

```shell
git rm --cached 子模块名称
```

完成删除后，提交到仓库即可。
