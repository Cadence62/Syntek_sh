#!/bin/bash
mount -t nfs 192.168.3.245:/tools/Software /mnt
cp -Rf /mnt/* /tools/Software/
cp -Rf /tools/Software/I386/* /usr/lib
cp /toosls/Software/I386/stubs-32.h /usr/include/gnu
