#!/bin/ksh

#####################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   slssldplp.ksh  $
# $Revision: /main/1 $
# $Modtime:    $
######################################################################

######################################################################
#  This is an aggregate program for Retail Analytics which triggers  #
#  the ODI package   PLP_RETAILSALESITSCLCDYAGGREGATE                #
######################################################################


################BOF This is part of the ra_profile####################

. $MMHOME/etc/ra.env


SCEN_NAME="PLP_BBG_RETAILSALESTRXAGGREGATE"

echo "LOADING TABLE=W_RTL_SLS_TRX_LC_DY_A"
startscen.sh $SCEN_NAME $VERSION $CONTEXT 


#######################################################################
#                         End of Script                               #
#######################################################################
