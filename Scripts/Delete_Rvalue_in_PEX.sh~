#!/bin/bash
#program
 
#
#History
#Delete_Rvalue_in_PEX
#2013.4.20
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "Delete_Rvalue_in_PEX"
read -p "Pleas input the file address you want to  find!  :" site
read -p "pleas input the file name you wany to find!   :" name

sed -i 's/ r=[0-9]*\.[0-9]*e+[0-9]*/ /g' $site/$name
sed -i 's/ r=[0-9]*\.[0-9]*/ /g' $site/$name
sed -i 's/ r=[0-9]*/ /g' $site/$name

 echo "OK"
exit 0
