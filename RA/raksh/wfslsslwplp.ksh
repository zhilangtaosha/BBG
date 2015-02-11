#!/bin/ksh

#####################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   wfslsslwplp.ksh  $
# $Revision: /main/1 $
# $Modtime:    $
######################################################################

############################################################################# 
# This is an aggregate program for Retail Analytics which triggers          #
# the ODI package PLP_RETAILWHOLESALEFRANCHISESCLCDYWKAGGREGATE             #
#############################################################################


################BOF This is part of the ra_profile####################

. $MMHOME/etc/ra.env

TBL_NAME="W_RTL_SLSWF_SC_LC_WK_A"
SCEN_NAME="PLP_RETAILWHOLESALEFRANCHISESCLCDYWKAGGREGATE"

echo "LOADING TABLE=W_RTL_SLSWF_SC_LC_WK_A" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT RA_BI.RA_TABLENAME=${TBL_NAME}

#######################################################################
#                         End of Script                               #
####################################################################### 