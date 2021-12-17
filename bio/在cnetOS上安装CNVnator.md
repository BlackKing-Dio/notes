cnvnator源需要的*.h头文件比较繁琐，如果直接按https://github.com/abyzovlab/CNVnator上的步骤编译，会很容易出现头文件找不到的情况，当然你也可以一个一个自己吧头文件的资源搞到手，通过环境变量$CPLUS_INCLUDE_PATH把他们放进去
这里安利一个比较投机的方法，通过安装speedseq（https://github.com/hall-lab/speedseq#cnvnator），然后把自带的cnvnator编译出来

```shell
#第一步 下载root文件包
curl -OL ftp://root.cern.ch/root/root_v5.34.20.source.tar.gz tar -zxvf root_v5.34.20.source.tar.gz cd root ./configure --prefix=$PWD make
#第二步 ，刷新这个包里的thisroot.sh文件

source /pathto/root/bin/thisroot.sh

#第三步，打开speedseq所在目录，进行编译
cd $SPEEDSEQ_DIR make cnvnator

#第四步，将source /pathto/root/bin/thisroot.sh 放入speed.config文件或者~/.bashrc中

#第五步，进入speedseq/src/CNVnator，编译：
make

安装完成
```