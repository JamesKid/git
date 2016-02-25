# ================================JamesKid============================== 
# @author				: JamesKid  
# @description :  this is note about svn use in linux 
# @change				:
# ======================================================================

# install 
		# client 
			yum install svn
		# server
 
#  use 
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
		# info  (查看文件详细信息)
				svn info path  # 例如：svn info test.php
		# diff  (比较差异)
				svn diff path # (将修改的文件与基础版本比较)
				svn diff test.php

				

