#!/bin/ksh

##################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   slsiltsde.ksh  $
# $Revision: /main/1 $
# $Modtime:    $
###################################################################

###################################################################
# This is a source dependant extract (SDE) program for Retail     #
# Analytics which triggers the ODI package                        #
# MASTER_SDE_RETAIL_SALESTRANSACTIONFACT                          #
###################################################################


################BOF This is part of the ra_profile#################

. $MMHOME/etc/ra.env


SCEN_NAME="MASTER_SDE_RETAIL_SALESTRANSACTIONFACT"

echo "LOADING TABLE =W_RTL_SLS_TRX_IT_LC_DY_FS and W_RTL_SLSPK_IT_LC_DY_FS" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT 

####################################################################
#                       End of Script                              #
####################################################################