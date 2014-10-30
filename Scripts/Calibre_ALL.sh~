#!/bin/bash -f
#Program
#   PIPO Stream Out
# History                                
# 2013.4.29 Mengfan 

read -p "Please input rundir :" rundir
read -p "Please input libname :" libname
read -p "Please input topcell :" topcell

///////////////////////////////////////// Layout Extraction ////////////////////////////////////////////

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

///////////////////////////////////////// Schematic Netlist Extraction /////////////////////////////////////

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
hnlNetlistFileName = "$topcell.src.net"
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

///////////////////////////////////////// Calibre DRC ////////////////////////////////////////////

cat > $topcell.drc <<EOF

//
//  Rule file generated on Fri Mar 01 11:01:17 CST 2013
//     by Calibre Interactive - DRC (v2011.2_34.26)
//
//      *** PLEASE DO NOT MODIFY THIS FILE ***
//
//

LAYOUT PATH  "$rundir/$topcell.calibre.db"
LAYOUT PRIMARY "$topcell"
LAYOUT SYSTEM GDSII

DRC RESULTS DATABASE "$rundir/$topcell.drc.results" ASCII 
DRC MAXIMUM RESULTS 1000
DRC MAXIMUM VERTEX 4096

DRC CELL NAME NO
DRC SUMMARY REPORT "$rundir/$topcell.drc.summary" APPEND HIER

VIRTUAL CONNECT COLON NO
VIRTUAL CONNECT REPORT NO

DRC ICSTATION YES

INCLUDE "/tools/Software/Configurations/Calibre/Calibre_20130312.drc"

EOF

calibre -drc -hier -nowait $rundir/$topcell.drc

///////////////////////////////////////// Calibre LVS ////////////////////////////////////////////

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

SOURCE PATH "$rundir/$topcell.src.net"
SOURCE PRIMARY "$topcell"
SOURCE SYSTEM SPICE

MASK SVDB DIRECTORY "svdb" QUERY XRC

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
// calibre -spice $rundir/$topcell.src.net -lvs -hier -nowait $rundir/$topcell.lvs
calibre -lvs -hier -nowait  $rundir/$topcell.lvs -spice $rundir/svdb/$topcell.sp


///////////////////////////////////////// Calibre xRC ////////////////////////////////////////////

cat > $topcell.rcx <<EOF
//
//  Rule file generated on Tue May 07 14:10:38 CST 2013
//     by Calibre Interactive - PEX (v2011.2_34.26)
//
//      *** PLEASE DO NOT MODIFY THIS FILE ***
//
//

LAYOUT PATH  "$rundir/$topcell.calibre.db"
LAYOUT PRIMARY "$topcell"
LAYOUT SYSTEM GDSII

SOURCE PATH "$rundir/$topcell.src.net"
SOURCE PRIMARY "$topcell"
SOURCE SYSTEM SPICE

MASK SVDB DIRECTORY "svdb" QUERY XRC

LVS REPORT "$topcell.lvs.report"

////////// Specify the output of PEX, CalibreView or Hspice Netlist

// PEX NETLIST SIMPLE "$topcell.pex.netlist" CALIBREVIEW 1 SOURCENAMES LOCATION 
// PEX NETLIST "$topcell.pex.netlist" CALIBREVIEW 1 SOURCENAMES LOCATION 
PEX NETLIST "$topcell.pex.netlist" HSPICE 1 SOURCENAMES 



PEX REPORT "$topcell.pex.report" SOURCENAMES
PEX REDUCE ANALOG NO
PEX NETLIST UPPERCASE KEYWORDS NO
PEX NETLIST VIRTUAL CONNECT NO
PEX NETLIST NOXREF NET NAMES YES
PEX NETLIST MUTUAL RESISTANCE YES
LVS REPORT OPTION NONE
LVS FILTER UNUSED OPTION NONE SOURCE
LVS FILTER UNUSED OPTION NONE LAYOUT

LVS RECOGNIZE GATES ALL



VIRTUAL CONNECT COLON NO
VIRTUAL CONNECT REPORT NO

DRC ICSTATION YES


INCLUDE "/tools/Software/Configurations/Calibre/Calibre_20121114.rcx"


EOF

////////// Extract RCC

calibre -lvs -hier -spice $rundir/svdb/$topcell.sp -nowait $rundir/$topcell.rcx
calibre -xrc -pdb -rcc -turbo 1 -nowait $rundir/$topcell.rcx
calibre -xrc -fmt -all -nowait $rundir/$topcell.rcx

////////// Extract no-RCC

// calibre -xrc -pdb -turbo 1 -nowait $rundir/$topcell.rcx
// calibre -xrc -fmt -simple -nowait $rundir/$topcell.rcx




// calibre rve //

calibre -rve $rundir/$topcell.drc.results
calibre -nowait -rve -lvs $rundir/svdb $topcell
calibre -nowait -rve -pex $rundir/svdb $topcell


exit 1

