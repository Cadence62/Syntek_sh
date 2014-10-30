#!/bin/bash -f
#Program
#   PIPO Stream Out
# History                                
# 2013.4.29 Mengfan 

read -p "Please input rundir :" rundir
read -p "Please input libname :" libname
read -p "Please input topcell :" topcell


setupfile=gdsOut.il

mapfile=/tools/Software/Configurations/Calibre/virtuoso_018um_v210a_out.map
mapname=.virtuoso_018um_v210a_outl

cat >$setupfile <<EOF
streamOutKeys = list(nil
'layerTable                ""
'convertPin                "geometry"
'libVersion                "5.0"
'units                     "micron"
'scale                     0.001
'cellMapTable              ""
'caseSensitivity           "preserve"
'errFile                   "PIPO.LOG.$topcell"
'outFile                   "$rundir/$topcell.calibre.db"
'viewName                  "layout"
'primaryCell               "$topcell"
'libName                   "$libname"
'runDir                    "$rundir"
)
EOF
pipo strmout $setupfile  > ${topcell}.gds

cd $rundir
cat > si.env <<EOF
simLibName = "$libname"
simCellName = "$topcell"
simViewName = "schematic"
simSimulator = "auCdl"
simNotIncremental = nil
simReNetlistAll = nil
simViewList = '("auCdl" "schematic")
simStopList = '("auCdl")
hnlNetlistFileName = "$topcell.sp"
resistorModel = ""
shortRES = 2000.0
preserveRES = 'nil
checkRESVAL = 'nil
checkRESSIZE = 'nil
preserveCAP = 'nil
checkCAPVAL = 'nil
checkCAPAREA = 'nil
preserveDIO = 'nil
checkDIOAREA = 'nil
checkDIOPERI = 'nil
checkCAPPERI = 'nil
checkScale = "meter"
checkLDD = 'nil
pinMAP = 'nil
shrinkFACTOR = 0.0
globalPowerSig = ""
globalGndSig = ""
displayPININFO = 't
preserveALL = 'nil
setEQUIV = ""
incFILE = ""
EOF
si -batch -command netlist

cat > $topcell.lvs <<EOF
//
//  Rule file generated on Thu Apr 25 14:51:01 CST 2013
//     by Calibre Interactive - LVS (v2011.2_34.26)
//
//      *** PLEASE DO NOT MODIFY THIS FILE ***
//
//

LAYOUT PATH  "$rundir/$topcell.calibre.db"
LAYOUT PRIMARY "$topcell"
LAYOUT SYSTEM GDSII

SOURCE PATH "$rundir/$topcell.sp"
SOURCE PRIMARY "$topcell"
SOURCE SYSTEM SPICE

MASK SVDB DIRECTORY "svdb" QUERY

LVS REPORT "$topcell.lvs.report"

LVS REPORT OPTION NONE
LVS FILTER UNUSED OPTION NONE SOURCE
LVS FILTER UNUSED OPTION NONE LAYOUT
LVS REPORT MAXIMUM 50

LVS RECOGNIZE GATES ALL


LVS ABORT ON SOFTCHK NO
LVS ABORT ON SUPPLY ERROR YES
LVS IGNORE PORTS NO
LVS SHOW SEED PROMOTIONS NO
LVS SHOW SEED PROMOTIONS MAXIMUM 50

LVS ISOLATE SHORTS NO


VIRTUAL CONNECT COLON NO
VIRTUAL CONNECT REPORT NO
LVS EXECUTE ERC YES
ERC RESULTS DATABASE "$topcell.erc.results"
ERC SUMMARY REPORT "$topcell.erc.summary" REPLACE HIER
ERC MAXIMUM RESULTS 1000
ERC MAXIMUM VERTEX 4096

DRC ICSTATION YES

INCLUDE "/tools/Software/Configurations/Calibre/Calibre_20121114.lvs"

EOF
calibre -spice $rundir/$topcell.sp -lvs -hier -nowait $rundir/$topcell.lvs


exit 1

