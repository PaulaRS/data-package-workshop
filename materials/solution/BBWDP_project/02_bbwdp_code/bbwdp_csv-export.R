# 28: Bern-Basel 2021 WD Pilot

# Script                               28.M.3 Device Datafiles into csv.R
# Author                               RAA,  04.02.23   04.02.23
# uses information including           complete
# interesting parts                    write.csv

# Generate .csv files from .rda files for publication in the cloud, for DD manuscript


#######################
# A: Prepare          #
#######################


# A.1: Set working directory, Mac style
#######################################

dir()
setwd ("Eigene Dateien/Projects") 
setwd ("28 Device Pilot 2021/28.O Analysis") 
dir()
setwd("Device datafiles")
dir()

# A.2: Trial with one file
##########################

# First trial

load ("Core_p_001.rda")
str (Core_p_001)

write.csv (Core_p_001, file="Core_p_001.csv")

# open in Excel, via "Daten" "aus Text" "Ursprung Windows", "Trennzeichen Komma", Rest wie vorgegeben

# contains many calculated information, restrict to c(1:7,11:13) would help
# not full source information from Core, but I'd say we leave that here
# if somebody wants to get everything
# - he gets everything (information, per second) upon request
# - but builds patient data from device together himself

# Second trial
write.csv (Core_p_001[,c(1:7,11:13) ], file="Core_p_001.csv")

# Third trial: OK!
write.csv (Core_p_001[,c(1:6,11:13) ], file="Core_p_001.csv")
