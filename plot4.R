# --------------------------------------------------------------------
# file: plot4.R
#
# This code produces the plot4.png file
# This code assumes that the required data is in the directory where the
# R file is run. The plot4.png file is also created in the same directory
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
    ## setting the parameters for the x-axix lbels and positions
Sys.setlocale("LC_TIME","English") ## changing the locale to English
dt1 <- weekdays(as.Date("1/2/2007","%d/%m/%Y"), abbreviate=T)
dt2 <- weekdays(as.Date("2/2/2007","%d/%m/%Y"), abbreviate=T)
dt3 <- weekdays(as.Date("3/2/2007","%d/%m/%Y"), abbreviate=T)
lc1 <- 0
lc2 <- 1
lc3 <- 2
    ## setting base graphics environment parameters
par(mfrow=c(2,2), mar=c(5,4,3,1), oma=c(4,4,3,1), cex=0.6)
    ## plotting the graphs
with(SubsetData, {
     ## top left plot (Global Active Power)
       {
         plot(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
              as.numeric(global_active_power),
              type = "l",   ## line graph
              ylab="Global Active Power",
              xlab="")
         axis(1, labels=c(dt1,dt2,dt3), at=c(lc1,lc2,lc3))
       }
     
     ## top right plot (Voltage)
       {
         plot(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
              as.numeric(voltage),
              type = "l",  ## line graph
              ylab="Voltage",
              xlab="datetime")
         axis(1, labels=c(dt1,dt2,dt3), at=c(lc1,lc2,lc3))
       }
  
     ## bottom left plot (Energy sub metering)
       {
         plot(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
              as.numeric(sub_metering_1),
              type = "l", 
              ylab="Energy sub metering",
              xlab="",
              col="black")
         lines(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
               as.numeric(sub_metering_2), col="red")
         lines(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
               as.numeric(sub_metering_3), col="blue")
         legend("topright", lty=1, col=c("black","red","blue"),
                cex=0.6,  ## reducing the charcater size
                y.intersp=0.4,  ## reducing the line spacing
                bty = 'n',      ## no box around legend text
                legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
         axis(1, labels=c(dt1,dt2,dt3), at=c(lc1,lc2,lc3))
       }
     
     ## bottom right plot (Global_Reactive_Power)
       {
         plot(strptime(paste(date,time, sep=" "), "%d/%m/%Y %H:%M:%S"),
              as.numeric(global_reactive_power),
              type = "l",   ## line graph
              ylab="Global_reactive_power",
              xlab="datetime")
         axis(1, labels=c(dt1,dt2,dt3), at=c(lc1,lc2,lc3))         
       }
     }
     )

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
