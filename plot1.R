# --------------------------------------------------------------------
# file: plot1.R
#
# This code produces the plot1.png file
# This code assumes that the required data is in the directory where the
# R file is run. The plot1.png file is also created in the same directory
# --------------------------------------------------------------------
#
setwd("./Coursera/DataScienceTrack/ExploratoryDataAnalysis")
#
# read in the power consumption data
#
PconsumData   <- NULL
PconsumData   <- read.table("household_power_consumption.txt", skip=1, 
                            colClasses = "character",  
                            sep=";")
#
#  set the column names of the dataset
#
colNames  <- c("date","time","global_active_power",
               "global_reactive_power","voltage","global_intensity",
               "sub_metering_1","sub_metering_2","sub_metering_3")
names(PconsumData) <- colNames              
#
# select two days data for analysis: 2007-02-01 and 2007-02-02
#
SubsetData <- PconsumData[(as.character(PconsumData$date)=="1/2/2007"|as.character(PconsumData$date)=="2/2/2007"),] 
#
# create the first plot (plot1) and save in a png file
#
hist(as.numeric(SubsetData$global_active_power),col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
