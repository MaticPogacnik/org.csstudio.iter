#!../../bin/linux-x86_64/PLC
#+======================================================================
# $HeadURL: https://svnpub.iter.org/codac/iter/codac/dev/units/m-epics-iter-templates/tags/CODAC-CORE-5.2B4/templates/genericBoot/ioc/st.cmd $
# $Id: st.cmd 62306 2016-01-05 11:09:21Z kumard1 $
#
# Project       : CODAC Core System
#
# Description   : ITER ioc template EPICS start up file
#
# Author(s)     : This file was generated by CODAC development toolkit
#
# Copyright (c) : 2010-2016 ITER Organization,
#                 CS 90 046
#                 13067 St. Paul-lez-Durance Cedex
#                 France
#
# This file is part of ITER CODAC software.
# For the terms and conditions of redistribution or use of this software
# refer to the file ITER-LICENSE.TXT located in the top level directory
# of the distribution package.
#
#-======================================================================

< envPaths
< envSystem
< envUser

cd "${TOP}"

#############################################
## Register all support components         ##
#############################################

dbLoadDatabase "dbd/PLC.dbd"
PLC_registerRecordDeviceDriver pdbbase

< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/sddPreDriverConf.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/userPreDriverConf.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/threadSchedulingConf.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/dbToLoad.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/iocCTRL-SUP-PSH0PLC-preSaveRestore.cmd"

#############################################
## IOC Logging                             ##
#############################################
iocLogInit
iocLogPrefix "${STY} : "

#############################################
## IOC initialization                      ##
#############################################
cd "${TOP}/db"
iocInit

< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/iocCTRL-SUP-PSH0PLC-postSaveRestore.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/sddSeqToLoad.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/seqToLoad.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/sddPostDriverConf.cmd"
< "${TOP}/iocBoot/iocCTRL-SUP-PSH0PLC/userPostDriverConf.cmd"


dbl > "${CODAC_VAR}/iocdump/${UNIT_NAME}/${IOC_NAME}-${IOC_BOOT_TIME}.dbl"
dbior > "${CODAC_VAR}/iocdump/${UNIT_NAME}/${IOC_NAME}-${IOC_BOOT_TIME}.dbior"
dbhcr > "${CODAC_VAR}/iocdump/${UNIT_NAME}/${IOC_NAME}-${IOC_BOOT_TIME}.dbhcr"
