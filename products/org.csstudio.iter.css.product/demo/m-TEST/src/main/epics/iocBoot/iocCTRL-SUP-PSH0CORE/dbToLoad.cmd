
#======================================================================
# Loading DBs
#======================================================================
cd $(TOP)/db
dbLoadRecords("PSH0-CTRL-SUP-BOY.db")

#======================================================================
# Loading Substitution Files 
#======================================================================
cd $(TOP)/iocBoot/$(IOC)
dbLoadTemplate("PSH0-VLV_CTRL_v1.substitution")



#======================================================================
# IOC Monitor
#======================================================================
cd $(EPICS_ROOT)/db
dbLoadRecords("iocmon.db","CBS=CTRL-SUP-, CTRLTYPE=H, IDX=0, IOCTYPE=CORE")
