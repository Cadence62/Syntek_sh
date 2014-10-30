#!/bin/bash -f
#Program
#   PIPO Stream Out
# History                                
# 2013.4.29 Mengfan 

read -p "Please input rundir :" rundir
read -p "Please input libname :" libname
read -p "Please input topcell :" topcell

// ////////////////////////////////////// Create CalibreView ////////////////////////////////////////////

cat > $topcell.skill <<EOF

procedure( Create_CalibreView( nil )

mgc_eview_globals->outputLibrary = "libname"
mgc_eview_globals->schematicLibrary = "libname"
mgc_eview_globals->extViewType = "schematic"
mgc_rve_create_cellview("$rundir/$topcell.pex.netlist")

) ; ** procedure **

EOF

load("$rundir/$topcell.skill" "Create_CalibreView")



exit 1
