# --------------------------------------------------------------------
# file: plot2.R
#
# This code produces the plot2.png file
# This code assumes that the required data is in the directory where the
# R file is run. The plot2.png file is also created in the same directory
# --------------------------------------------------------------------
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
# create the second plot (plot2) and save in a png file
#
Sys.setlocale("LC_TIME","English") ## changing the locale to English
dt1 <- weekdays(as.Date("1/2/2007","%d/%m/%Y"), abbreviate=T)
dt2 <- weekdays(as.Date("2/2/2007","%d/%m/%Y"), abbreviate=T)
dt3 <- weekdays(as.Date("3/2/2007","%d/%m/%Y"), abbreviate=T)
lc1 <- 0
lc2 <- 1
lc3 <- 2

with(SubsetData, {
     plot(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
          as.numeric(global_active_power),
          type = "l", 
          ylab="Global Active Power (kilowatts)",
          xlab=""
          )
     axis(1, labels=c(dt1,dt2,dt3), at=c(lc1,lc2,lc3))}
     )

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
