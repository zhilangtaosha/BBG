#!/bin/ksh

#####################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   nprftsldplp.ksh  $
# $Revision: /rgbura_13.2.3_branch/1 $
# $Modtime:    $
######################################################################

###################################################################### 
#  This is an aggregate program for Retail Analytics which triggers  #
#  the ODI package PLP_RETAILNETPROFITAGGREGATE                      #
######################################################################


################BOF This is part of the ra_profile####################

. $MMHOME/etc/ra.env

TBL_NAME="TMP"
SCEN_NAME="PLP_RETAILNETPROFITAGGREGATE"


echo "LOADING TABLE=TMP" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT RA_BI.RA_TABLENAME=${TBL_NAME}


TBL_NAME="W_RTL_NPROF_SC_LC_DY_A"
SCEN_NAME="PLP_RETAILNETPROFITAGGREGATE"


echo "LOADING TABLE =W_RTL_NPROF_SC_LC_DY_A" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT RA_BI.RA_TABLENAME=${TBL_NAME}



#######################################################################
#                         End of Script                               #
#######################################################################
