#!/bin/ksh

##################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   slsfcilwsde.ksh  $
# $Revision: /main/1 $
# $Modtime:    $
###################################################################

###################################################################
# This is a source dependant extract (SDE) program for Retail     #
# Analytics which triggers the ODI package                        #
# MASTER_SDE_RETAILSALESFCWKFACT                                  #
###################################################################


################BOF This is part of the ra_profile#################

. $MMHOME/etc/ra.env


SCEN_NAME="MASTER_SDE_RETAILSALESFCWKFACT"

echo "LOADING TABLE =W_RTL_SLSFC_IT_LC_WK_FS" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT 

####################################################################
#                       End of Script                              #
####################################################################