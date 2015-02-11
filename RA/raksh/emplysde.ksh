#!/bin/ksh

##################################################################
# Copyright (c) 2010, 2011, Oracle and/or its affiliates. All rights reserved. 
# $Workfile:   emplysde.ksh  $
# $Revision: /main/1 $
# $Modtime:    $
###################################################################

###################################################################
# This is a source dependant extract (SDE) program for Retail     #
# Analytics which triggers the ODI package                        #
# SDE_RETAILEMPLOYEEDIMENSION                                     #
###################################################################


################BOF This is part of the ra_profile#################

. $MMHOME/etc/ra.env


SCEN_NAME="SDE_RETAILEMPLOYEEDIMENSION"

echo "LOADING TABLE =W_EMPLOYEE_DS" 
startscen.sh $SCEN_NAME $VERSION $CONTEXT 

####################################################################
#                       End of Script                              #
####################################################################