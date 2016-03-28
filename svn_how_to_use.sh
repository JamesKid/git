# ================================JamesKid============================== 
# @author				: JamesKid  
# @description :  this is note about svn use in linux 
# @change				:
# ======================================================================

# install 
		# client 
				# install 1.8 verstion
						# web 
								http://tecadmin.net/install-subversion-1-8-on-centos-rhel/
						# install
								# step1
									vim /etc/yum.repos.d/wandisco-svn.repo 	
										[WandiscoSVN]
										name=Wandisco SVN Repo
										baseurl=http://opensource.wandisco.com/centos/$releasever/svn-1.8/RPMS/$basearch/
										enabled=1
										gpgcheck=0
								# step2
										yum remove subversion
								# step3
										yum clean all 
										yum install subversion
										svn --version
		# server
 
#  use 
		# help 帮助
				svn --help  # 打开帮助文件
				svn --help switch # 打开swith的帮助文件

		# cat 
				svn cat -r 4 test.c     #查看版本4中的文件test.c的内容,不进行比较。

		# learn web
				http://blog.chinaunix.net/uid-22150747-id-189264.html

		# checkout (下载到本地目录) 
				svn checkout path  # 例如：svn checkout svn://192.168.1.1/pro/domain
				svn co       # 简写

		# add      (添加文件)
				svn add file       # svn add *.php

		# commit   (提交)
				svn commit -m "LogMessage" [-N] [--no-unlock] PATH(如果选择了保持锁，就使用--no-unlock开关) 
				# 例如：svn commit -m "add test file for my test" test.php 
				svn co       # 简写

		# lock  (加锁，解锁)
				svn lock -m "lock test file" test.php  # 加锁
				svn unlock PATH                        # 解锁

		# update  (更新到某个版本)
				svn update -r m path
				svn up   # 简写
				# tips 
						svn update如果后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本。
						svn update -r 200 test.php(将版本库中的文件test.php还原到版本200)
						svn update test.php(更新，于版本库同步。如果在提交的时候提示过期的话，是因为冲突，需要先update，修改文件，然后清除svn resolved，最后再提交commit)
						
		# stauts   (查看文件或目录状态)
				svn status path     # （目录下的文件和子目录的状态，正常状态不显示）
				svn status -v path  #  (显示文件和子目录状态)
				svn st    # shortcut

		# delete (删除)
				svn delete path -m "delete test fle"
				svn delete svn://192.168.1.1/pro/domain/test.php -m "delete test file"
				svn delete test.php | svn ci -m 'delete test file' # 推荐使用这种

		# log  (查看日志)
				svn log path  # 查看日志
				svn log -r 4:20 #只看版本4到版本20的日志信息，顺序显示。
				svn log -r 20:5 #显示版本20到4之间的日志信息，逆序显示。
				svn log test.c  #查看文件test.c的日志修改信息。
				svn log -r 8 -v #显示版本8的详细修改日志，包括修改的所有文件列表信息。
				svn log -r 8 -v -q   #显示版本8的详细提交日志，不包括comment。
				svn log -v -r 88:866 #显示从版本88到版本866之间，当前代码目录下所有变更的详细信息 。
				svn log -v dir  #查看目录的日志修改信息,需要加v。
				svn log http://foo.com/svn/trunk/code/  #显示代码目录的日志信息。

		# info  (查看文件详细信息,所在分支)
				svn info path  # 例如：svn info test.php

		# diff  (比较差异)
				svn diff path # (将修改的文件与基础版本比较)
				svn diff test.php
				svn diff .    # 查看当前项目改变了的内容
				svn diff  -r 200:201 test.php    # 对修正版本号200 和 修正版本号201 比较差异
				svn diff               #什么都不加，会坚持本地代码和缓存在本地.svn目录下的信息的不同;信息太多，没啥用处。
				svn diff -r 3          #比较你的本地代码和版本号为3的所有文件的不同。
				svn diff -r 3 text.c   #比较你的本地代码和版本号为3的text.c文件的不同。
				svn diff -r 5:6        #比较版本5和版本6之间所有文件的不同。
				svn diff -r 5:6 text.c #比较版本5和版本6之间的text.c文件的变化。
				svn diff -c 6 test.c    #比较版本5和版本6之间的text.c文件的变化。

		# list  (查看文件，查看列表)
				svn list http://xx.xx.la/program/branch  # 查看program项目分支
				svn list -v http://svn.test.com/svn  #查看详细的目录的信息(修订人,版本号,文件大小等)。
				svn ls  # 简写 

		# mkdir ( 创建纳入版本控制下的新目录)

				 svn mkdir 目录名
				 svn mkdir newdir

		# switch （切换分支)
				svn switch ^/branches/branchesName  # 切换到分支branchesName 下
				svn swith ^/trunk   # 切换到trunk 分支

		# merge (合并分支)
				svn merge -r m:n path
				svn merge -r 200:205 test.php #（将版本200与205之间的差异合并到当前文件，但是一般都会产生冲突，需要处理一下）

		# revert (恢复本地修改)
				svn revert foo.c		# 丢弃对一个文件的修改

		# resolved (解决冲突)
			svn resolved [本地目录全路径] 
				


				

