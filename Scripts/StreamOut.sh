#!/bin/bash -f
#set rundir = `pwd` 
#set setupfile = gdsOut.il
#set project = xxx
rundir=/root
setupfile=gdsOut.il
project=test1
#if ( $#argv < 2 ) then
#  echo
#  echo "==============================================================="
#  echo "|                  *  PIPO Stream Out   *                     |"
#  echo "|   Usage: gdsOut <libname> <topcell> [map_switch] [outdir]   |"
#  echo "|   Output: <topcell>.gds                                     |"
#  echo "|   Last relase at:   Sep/28/2004   Copyright (c)XXX semi     |"
#  echo "==============================================================="
#  echo "  Notes:  the log file name is : PIPO.LOG.<topcell>   "
#  echo "==============================================================="
#  echo
# exit 1
#else if ( $#argv == 2 ) then
#  set libname = $1
#  set topcell = $2
#  set mapto = "none"
#  set outdir = `pwd`
#else if ( $#argv == 3 ) then
#  set libname = $1
#  set topcell = $2
#  set mapto = $3 
#  set outdir = `pwd`
#else if ( $#argv == 4 ) then
#  set libname = $1
#  set topcell = $2
#  set mapto = $3
#  set outdir = $4 
#else
#  echo
# echo "==============================================================="
#  echo "|                  *  PIPO Stream Out   *                     |"
#  echo "|   Usage: gdsOut <libname> <topcell> [map_switch] [outdir]   |"
#  echo "|   Output: <topcell>.gds                                     |"
#  echo "|   Last relase at:   Sept/13/2004  Copyright (c)XXX semi     |"
#  echo "==============================================================="
#  echo "  Notes:  the log file name is : PIPO.LOG.<topcell>   "
#  echo "==============================================================="
#  echo
#  exit 1
#endif

libname=tpa018nv_270a_mt
topcell=DB1A
mapto="none"
outdir=/root/test
#if ( ! -r $rundir/cds.lib ) then
#   echo
#   echo "========================= WARNING ============================="
#   echo "** Cannot locate $rundir/cds.lib, default cds.lib will be used **"
#   echo "===================== GDS OUT  Abort =========================="
#   if ( ! -r $project/layout/cds.lib ) then
#      echo
#      echo "========================= ERROR ============================="
#      echo "** Cannot locate $project/layout/cds.lib **"
#      echo "===================== GDS OUT  Abort =========================="
#      echo
#     exit 1
#   endif
#ln -s $project /root/cds.lib
#   echo
#endif
#if ( ! -d $outdir) then
#   echo
#   echo -n "Output dir $outdir not exist, create it or not? (Y) or (N) "  set ans=$<
#   if ( $ans == "N" || $ans == "n" ) then
#      exit 1
#   else
#      mkdir $outdir
#   endif
#endif

#if ( $mapto == "YYYY" || $mapto == "YYYY" ) then 

#&nbsp;
mapfile=/tools/Software/Configurations/Calibre/virtuoso_018um_v210a_out.map
mapname=.virtuoso_018um_v210a_out
#else if ( $mapto == "ZZZZ" || $mapto == "ZZZZ" ) then

#  set mapfile = $project/tf/ZZ.map 
#  set mapname = .ZZZZ
#else
# set mapfile = "" 
#  set mapname = "" 
#endif 
#cat <<EOF > $setupfile

cat >gdsOut.il <<EOF
streamOutKeys = list(nil
'layerTable                ""
'convertPin                "geometry"
'libVersion                "5.0"
'units                     "micron"
'scale                     0.001
'cellMapTable              ""
'caseSensitivity           "preserve"
'errFile                   "PIPO.LOG.PDB1A"
'outFile                   "/root/test/PDB1A.calibre.db"
'viewName                  "layout"
'primaryCell               "PDB1A"
'libName                   "tpa018nv_270a_mt"
'runDir                    "/root/test/"
)
EOF

pipo strmout $setupfile  > ${topcell}.gds
exit 1
