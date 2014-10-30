#!/bin/bash
#program
 
#
#History
#2013.4.20
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

find_clear()
{
read -p "1)find  2)find and clear :" number
case $number in
  1)
    read -p "Pleas input the file address you want to  find!  :" site
    read -p "Pleas input the  file name you wang to find! :" postfix
    find $site -name "$postfix" ;
    return 0 ;;
     
   2) 
    read -p "Pleas input the file address you want to clear!  :" site
    find $site -name "*.cdslck" -type f -print -exec rm -rf {} \;
    return 0 ;;
   *)
    return 1 ;;
    esac
     }



if  find_clear "$number"
then
 echo "OK"
else
 echo "what you input is wrong (1/2)?"
fi
exit 0




 

