安装步骤的话，PB已经在github上给出：
https://github.com/PacificBiosciences/FALCON-integrate/wiki/Installation

这里需要注意的一点是，官方建议用python2.7.9.
并修改为默认使用的python（可以通过环境变量修改）

然后运行官网上的命令:
export GIT_SYM_CACHE_DIR=~/.git-sym-cache # to speed things up git clone git://github.com/PacificBiosciences/FALCON-integrate.git cd FALCON-integrate git checkout develop # or whatever version you want git submodule update --init --recursive # Note: You must do this yourself! No longer via `make init`. make init source env.sh make config-edit-user make -j all make test # to run a simple one
接着，为了方便呢，可以把
FALCON-integrate/fc_env/bin/fc_run 建立一个软连接或者直接把放在你的环境变量里，以后可以直接调用

然后我们到FALCON-integrate/FALCON-examples/run/ecoli2下面试运行：
fc_run fc_run.cfg
出现报错：
[ERROR]Failed to read JSON from '/public/home/hangjf/software/FALCON-integrate/FALCON-examples/run/ecoli2/0-rawreads/daligner-scatter/scattered.json'
Traceback (most recent call last):
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 24, in create_daligner_tasks
    content = json.loads(open(scatter_fn).read())  # array of descriptions
IOError: [Errno 2] No such file or directory: '/public/home/hangjf/software/FALCON-integrate/FALCON-examples/run/ecoli2/0-rawreads/daligner-scatter/scattered.json'
Traceback (most recent call last):
  File "/public/home/hangjf/software/FALCON-integrate/fc_env/bin/fc_run", line 11, in
   load_entry_point('falcon-kit', 'console_scripts', 'fc_run')()
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 504, in main
    main1(argv[0], args.config, args.logger)
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 150, in main1
   input_fofn_plf=input_fofn_plf,
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 243, in run
    rawread_dir, scattered_plf)
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 28, in create_daligner_tasks
    raise Exception(msg)
Exception: Failed to read JSON from '/public/home/hangjf/software/FALCON-integrate/FALCON-examples/run/ecoli2/0-rawreads/daligner-scatter/scattered.json'

查看日志文件all.log，发现如下信息：
IOError: [Errno 2] No such file or directory: '/XXX/FALCON-integrate/FALCON-examples/run/ecoli2/0-rawreads/daligner-scatter/scattered.json'
但这个是由于你的配置文件fc_run.cfg里面有个作业提交的参数，因为我的是PBS作业系统，而配置文件中
jobqueue = your_queue
sge_option_da = -pe smp 8 -q %(jobqueue)s
sge_option_la = -pe smp 2 -q %(jobqueue)s
sge_option_pda = -pe smp 8 -q %(jobqueue)s
sge_option_pla = -pe smp 2 -q %(jobqueue)s
sge_option_fc = -pe smp 24 -q %(jobqueue)s
sge_option_cns = -pe smp 8 -q %(jobqueue)s
这些参数都是SGE的提交参数，需要把他们改为PBS。

具体如下：
job_type = PBS
XXXXXX
XXXXXX
jobqueue = fat
sge_option_da = -l mem=8gb -q %(jobqueue)s
sge_option_la = -l mem=2gb -q %(jobqueue)s
sge_option_pda = -l mem=8gb -q %(jobqueue)s
sge_option_pla = -l mem=2gb -q %(jobqueue)s
sge_option_fc = -l mem=24gb -q %(jobqueue)s
sge_option_cns = -l mem=8gb -q %(jobqueue)s

运行开始，但是又出现报错：
[INFO]!qdel P5af0c81b1fb844
qdel: illegally formed job identifier: P5af0c81b1fb844
[INFO]!qdel P73544e80037fb9
qdel: illegally formed job identifier: P73544e80037fb9
Traceback (most recent call last):
  File "/public/home/hangjf/software/FALCON-integrate/fc_env/bin/fc_run", line 11, in
   load_entry_point('falcon-kit', 'console_scripts', 'fc_run')()
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 504, in main
    main1(argv[0], args.config, args.logger)
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 150, in main1
   input_fofn_plf=input_fofn_plf,
  File "/public/home/hangjf/software/FALCON-integrate/FALCON/falcon_kit/mains/run1.py", line 216, in run
   wf.refreshTargets([rdb_build_done])
  File "/public/home/hangjf/software/FALCON-integrate/pypeFLOW/pypeflow/simple_pwatcher_bridge.py", line 273, in refreshTargets
   self._refreshTargets(updateFreq, exitOnFailure)
  File "/public/home/hangjf/software/FALCON-integrate/pypeFLOW/pypeflow/simple_pwatcher_bridge.py", line 339, in _refreshTargets
    raise Exception(msg)
Exception: Some tasks are recently_done but not satisfied: set([Node(0-rawreads)])

去FALCON-integrate/FALCON-examples/run/ecoli2/0-rawreads/pwatcher.dir下面查看stderr
原来是因为PBS的任务id（qstat 第一列）在
fs_based.py这个脚本里面被默认为任务名（qstat 第四列），
在脚本中加入以下两行：
get_jobid_cmd  = "qstat -a|grep \'"+ job_name +"\'|awk \'{print $1}\'"
job_id = os.popen(get_jobid_cmd).read().strip()
这样，qdel就不会出现报错了。

再次运行，等待.......
运行成功
