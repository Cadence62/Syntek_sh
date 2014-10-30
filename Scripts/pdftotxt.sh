#!/bin/bash
#pdfto txt images
#history 1.1
#2014.9.24
#mengfan
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

cd $1

list=(`ls`)
list1=(`ls|awk 'BEGIN {FS="."}{printf("%s\n",$1)}'`)
num=${#list[@]}

echo "PDF number $num"

for((i=1;i<$num;i++))
do
#echo "${list1[i]}"
mkdir -p $PWD/${list1[i]}
pdftotext ${list[i]} -nopgbrk -layout $PWD/${list1[i]}/${list1[i]}.txt
pdfimages ${list[i]} $PWD/${list1[i]}/${list1[i]}
mv $PWD/${list[i]} $PWD/${list1[i]}

done

echo "OK"
exit


