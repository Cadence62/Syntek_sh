#!/usr/bin/python]
# coding:utf-8
# __author__ = 'mengfan'
# begin 2014.11.27

import os


class Function(object):
    def fun_pdf2txt(self, filedir):
        # list = [x for x in os.listdir('/home/mengfan/Desktop/sdfasd') if os.path.isfile(x) and os.path.splitext(x)[1]=='.pdf']
        os.chdir(filedir)
        # 却换到当前目录
        list = [x for x in os.listdir(filedir) if os.path.isfile(x) and os.path.splitext(x)[1] == '.pdf']
        # ['copy.py', 'ez_setup.py', 'int_for.py'] 找出当前文件夹系下面包含.py的文件取出文件名。

        # print list
        for file_name in list:
            newfile_name = file_name[:-4]
            # 取出前缀
            #copy int_for
            newdir = os.path.join(intput_dir, newfile_name)
            #拼接地址
            cmd_pdftotext = 'pdftotext ./' + file_name + ' -nopgbrk -layout ' + newdir + '/' + newfile_name + '.txt'
            cmd_pdfimages = 'pdfimages ./' + file_name + ' ' + newdir + '/'

            #print cmd_pdftotext
            #print cmd_pdfimages
            #print newfile_name
            #copy ez_seyup int_for
            os.mkdir(newdir)
            #创建文件
            os.system(cmd_pdftotext)
            os.system(cmd_pdfimages)
            #os.system()
            #pdftotext ./%d -nopgbrk -layout $PWD/${list1[i]}/${list1[i]}.txt
            #pdfimages ${list[i]} $PWD/${list1[i]}/${list1[i]}
            #mv $PWD/${list[i]} $PWD/${list1[i]}

    def fun_delete_cdslck(self, filedir):
        # list = [x fo x in os.walk(filedir)]x
        os.chdir(filedir)
        delete_name = '.pdf'
        for filename in os.listdir(filedir):
            #创建地址循环
            if os.path.isdir(os.path.join(filedir, filename)):
                #判断文件是不是目录
                self.fun_delete_cdslck(os.path.abspath(os.path.join(filedir, filename)))
                #是目侧则返回子目录地址 重调功能
            elif os.path.isfile(os.path.join(filedir, filename)):
                #判断是不是是文件
                if delete_name in filename:
                    #判断文件是不是带有自定义的字符串
                    rm_name = os.path.abspath(filename)
                    # 返回文件的绝对路径 返回的是的是当前工作目录+文件名 不是原地址 所以最上面要先进入工作目录
                    print rm_name


'''
os.listdir(dirname)：列出dirname下的目录和文件
os.getcwd()：获得当前工作目录
os.curdir:返回当前目录（.)
os.chdir(dirname):改变工作目录到dirname

os.path.isdir(name):判断name是不是一个目录，name不是目录就返回false
os.path.isfile(name):判断name是不是一个文件，不存在name也返回false
os.path.exists(name):判断是否存在文件或目录name
os.path.getsize(name):获得文件大小，如果name是目录返回0L

os.path.abspath(name):获得绝对路径
os.path.normpath(path):规范path字符串形式
os.path.split(name):分割文件名与目录（事实上，如果你完全使用目录，它也会将最后一个目录作为文件名而分离，同时它不会判断文件或目录是否存在）
os.path.splitext():分离文件名与扩展名
os.path.join(path,name):连接目录与文件名或目录
os.path.basename(path):返回文件名
os.path.dirname(path):返回文件路径


os.remove(dir) #dir为要删除的文件夹或者文件路径
os.rmdir(path) #path要删除的目录的路径。需要说明的是，使用os.rmdir删除的目录必须为空目录，否则函数出错。
'''

#intput_dir = '/home/mengfan/Desktop/sdfasd'
text = Function()
select = {'A': text.fun_pdf2txt, 'B': text.fun_delete_cdslck}

intput_number = raw_input("请输入你要执行的个功能: ")
intput_dir = raw_input("请输入你要执行的中地址： \n")
select.get(intput_number, 'A/B')(intput_dir)
exit()

'''
 list = [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
>>> list
['copy.py', 'ez_setup.py', 'int_for.py']
>>> for key in list:
... print key
  File "<stdin>", line 2
    print key
        ^
IndentationError: expected an indented block
>>> for key in list:
...     print key
...
copy.py
ez_setup.py
int_for.py
>>> for key in list:
...     print key[:-3]
...
copy
ez_setup
int_for
'''
