#!/bin/ksh

#####################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   slsslwplp.ksh $
# $Revision: /main/1 $
# $Modtime:    $
######################################################################

######################################################################
#  This is an aggregate program for Retail Analytics which triggers  #
#  the ODI package PLP_RETAILSALESCLDPLOCDYWKAGGREGATE               #
######################################################################


################BOF This is part of the ra_profile####################

. $MMHOME/etc/ra.env


SCEN_NAME="MASTER_SIL_RETAIL_SALESMARKDOWNFACT"


echo "LOADING TABLE=W_RTL_MKDN_IT_LC_DY_F"
startscen.sh $SCEN_NAME $VERSION $CONTEXT    


#######################################################################
#                         End of Script                               #
#######################################################################$
