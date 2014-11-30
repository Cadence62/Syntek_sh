#!/bin/bash
#pdfto txt images
#history 1.2
#2014.11.5
#mengfan
#1.1 BUG xxx.pdf.pdf xxx.xxx.pdf file > This is not run scripts.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

cd $1

list=(`find -name "*.pdf"|cut -c 3-|sort`)
#list=`ls`
#list1=(`ls|awk 'BEGIN {FS="."}{printf("%s\n",$1)}'`)
num=${#list[@]}
newlist=

#echo $list

echo "PDF number $num"

#for list1 in $list[@]
#do
#	echo $list 
#	newlist[i]=${list1%.pdf}
#done
#echo $newlist

echo "**************************************"
	

for (( i = 0 ; i < $num; i++ )); do
#	echo "${list[i]}"
	newlist[i]=${list[i]%.pdf}
#	echo "${newlist[i]}"
	mkdir -p $PWD/${newlist[i]}
	pdftotext $PWD/${list[i]} -nopgbrk -layout $PWD/${newlist[i]}/${newlist[i]}.txt
	pdfimages $PWD/${list[i]} $PWD/${newlist[i]}/${newlist[i]}
	#mv $PWD/${list[i]} $PWD/${newlist[i]}

done


#for((i=1;i<$num;i++))
#do
#echo "${list1[i]}"
#mkdir -p $PWD/${list1[i]}
##pdftotext ${list[i]} -nopgbrk -layout $PWD/${list1[i]}/${list1[i]}.txt
#pdfimages ${list[i]} $PWD/${list1[i]}/${list1[i]}
#mv $PWD/${list[i]} $PWD/${list1[i]}

#done

echo "OK"
exit