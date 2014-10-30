#!/bin/bash

mount -t nfs 192.168.3.172:/tools /mnt
mkdir /tools
cp -R /mnt/* /tools

echo /tools/Software/ic615/tools/bin/lmgrd -c /tools/Software/ic615/share/license/license.dat >> /etc/rc.d/rc.local

rpm -ivhf /tools/tigervnc-server-1.1.0-5.el6.x86_64.rpm

chkconfig vsftpd on
chkconfig vncserver on
chkconfig iptables off
chkconfig ip6tables off

setsebool -P ftp_home_dir=1

cat > /etc/sysconfig/vncservers <<EOF
VNCSERVERS="1:fangzhen"
VNCSERVERARGS[1]="-geometry 1600x900 -depth 24"
EOF

echo ok
exit
