#!/bin/bash
rm -R /tools/Library/
mount -t nfs 192.168.3.245:/tools/Library /mnt
mkdir /tools/Library
cp -Rf /mnt/* /tools/Library/
