#!/bin/ksh

#####################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   slscurrcdplp.ksh $
# $Revision: /main/1 $
# $Modtime:    $
######################################################################

###################################################################### 
#  This is an aggregate program for Retail Analytics which triggers  #
#  the ODI package PLP_RETAILSALESCORPORATEORGSCDYWKCURRAGGREGATE    #
######################################################################


################BOF This is part of the ra_profile####################

. $MMHOME/etc/ra.env

TBL_NAME="BBG_RA_SLS_CL_DY_CUR_A"
SCEN_NAME="PLP_RETAILSUPPSALESCORPORATEORGSCDYWKCURRAGGREGATE"


echo "LOADING TABLE=BBG_RA_SLS_CL_DY_CUR_A" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT RA_BI.RA_TABLENAME=${TBL_NAME}


#######################################################################
#                         End of Script                               #
#######################################################################
