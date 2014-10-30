#!/bin/bash -f
# Program
# PIPO Stream Out
# History                                
# 2013.4.29 Mengfan 

read -p "Please input rundir :" rundir
read -p "Please input libname :" libname
read -p "Please input topcell :" topcell

setupfile=gdsOut.il

cat >$setupfile<<EOF
streamOutKeys = list(nil
	'runDir			"$rundir"
	'libName		"$libname"
	'primaryCell		"$topcell"
	'viewName		"layout"
	'outFile		"$topcell.gds"
	'scale			0.001000
	'units			"micron"
	'compression		"none"
	'hierDepth		32
	'convertToGeo		nil
	'maxVertices		200
	'refLib			nil
	'libVersion		"5.0"
	'checkPolygon		nil
	'snapToGrid		nil
	'simMosaicToArray	nil
	'caseSensitivity	"preserve"
	'lineToZeroPath		"path"
	'convertDot	"ignore"
	'rectToBox		nil
	'convertPathToPoly	nil
	'keepPcell	t
	'useParentXYforText	nil
	'reportPrecision	nil
	'attachTechfileOfLib		"tsmc18rf"
	'runQuiet		nil
	'comprehensiveLog		nil
	'ignorePcellEvalFail		nil
	'errFile		"$rundir/PIPO.ERR.REPORT"
	'NOUnmappingLayerWarning		nil
	'techFileChoice		nil
	'pcellSuffix		"DbId"
	'respectGDSIILimits		nil
	'dumpPcellInfo		nil
	'genListHier		nil
	'cellMapTable		""
	'layerTable		"/tools/Software/Configurations/Calibre/virtuoso_018um_v210a.map"
	'textFontTable		""
	'convertPin		"geometry"
	'pinInfo		0
	'pinTextMapTable	""
	'propMapTable		""
	'propSeparator		","
	'userSkillFile		""
	'rodDir			""
	'refLibList		""
)
EOF

pipo strmout $setupfile


///////////////////////////////////////// Calibre DRC ////////////////////////////////////////////

cd $rundir
cat > $topcell.drc <<EOF

//
//  Rule file generated on Fri Mar 01 11:01:17 CST 2013
//     by Calibre Interactive - DRC (v2011.2_34.26)
//
//      *** PLEASE DO NOT MODIFY THIS FILE ***
//
//


LAYOUT PATH  "$rundir/$topcell.gds"
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
calibre -rve $rundir/$topcell.drc.results

///////////////////////////////////////// Calibre DRC  Antenna ////////////////////////////////////////////

cat > $topcell.ant <<EOF

//
//  Rule file generated on Fri Mar 01 11:01:17 CST 2013
//     by Calibre Interactive - ant (v2011.2_34.26)
//
//      *** PLEASE DO NOT MODIFY THIS FILE ***
//
//


LAYOUT PATH  "$rundir/$topcell.gds"
LAYOUT PRIMARY "$topcell"
LAYOUT SYSTEM GDSII

DRC RESULTS DATABASE "$rundir/$topcell.ant.results" ASCII 
DRC MAXIMUM RESULTS 1000
DRC MAXIMUM VERTEX 4096

DRC CELL NAME NO
DRC SUMMARY REPORT "$rundir/$topcell.ant.summary" APPEND HIER

VIRTUAL CONNECT COLON NO
VIRTUAL CONNECT REPORT NO

DRC ICSTATION YES

INCLUDE "/tools/Software/Configurations/Calibre/Antenna_20130312.drc"

EOF

calibre -drc -hier -nowait $rundir/$topcell.ant
calibre -rve $rundir/$topcell.ant.results


#!/bin/bash -f
#Program
#   PIPO Stream In
# History                                
# 2013.4.29 Mengfan 

# read -p "Please input rundir :" rundir
# read -p "Please input libname :" libname
# read -p "Please input topcell :" topcell

setupfilein=gdsin.il

cat >$setupfilein<<EOF
streamInKeys = list(nil
	'runDir			"$rundir"
	'inFile			"$rundir/$topcell.gds"
	'primaryCell		"$topcell"
	'libName		"${topcell}_IN"
	'techfileName		"/tools/Software/Configurations/Calibre/virtuoso_018um_6M_UTM40K_v29a.tf"
	'scale			0.001000
	'units			"micron"
	'errFile		"PIPO_IN.LOG"
	'refLib			nil
	'hierDepth		32
	'maxVertices		1024
	'checkPolygon		nil
	'snapToGrid		nil
	'arrayToSimMosaic	t
	'caseSensitivity	"preserve"
	'zeroPathToLine		"lines"
	'convertNode		"ignore"
	'keepPcell	nil
	'skipUndefinedLPP	nil
	'ignoreBox		nil
	'mergeUndefPurposToDrawing		nil
	'reportPrecision	nil
	'keepStreamCells		nil
	'attachTechfileOfLib		""
	'runQuiet		nil
	'noWriteExistCell		nil
	'NOUnmappingLayerWarning		nil
	'comprehensiveLog		nil
	'ignorePcellEvalFail		nil
	'appendDB		nil
	'genListHier		nil
	'cellMapTable		""
	'layerTable		"/tools/Software/Configurations/Calibre/virtuoso_018um_v210a.map"
	'textFontTable		""
	'restorePin		0
	'propMapTable		""
	'propSeparator		","
	'userSkillFile		""
	'rodDir			""
	'refLibOrder			""
)
EOF

pipo strmin $setupfilein

