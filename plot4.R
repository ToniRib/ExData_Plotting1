plot4 <- function(directory = getwd()){
      ## plot4 takes the directory of the household_power_consumption.txt file from
      ## the user and returns four plots in a 2x2 matrix into a png file. The four
      ## plots are as follows:
      ## Top Left: Global active power vs. time
      ## Top Right: Voltage vs. time
      ## Bottom Left: Submetering vs. time
      ## Bottom Right: Global reactive power vs. time
      ## If the user did not provide a directory, the function will use the 
      ## current working directory as a default.
      
      ## Function call:
      ## plot4()                  Uses working directory
      ## plot4("C:/R/Projects")   Uses directory C:/R/Projects
      
      ## Original code written by Toni M Rib, April 12 2015.
      ## ----------------------------------------------------------------------------
      
      ## Create the filepath to the household power consumption file
      filepath <- paste(directory, "household_power_consumption.txt", sep="/")
      
      ## Read in the data from the specified directory
      eData <- read.table(filepath, header=TRUE, sep=";", na.strings="?")
      
      ## Get only the data from 2/1/2007 and 2/2/2007
      ## Note: Date is in the format d/m/yyyy in the dataset
      DayData <- eData[eData$Date == "1/2/2007" | eData$Date == "2/2/2007", ]
      
      ## Open the png file with size 480 x 480
      png(filename = "plot4.png", width = 480, height = 480)
      
      ## Set the 2x2 matrix
      par(mfrow = c(2,2))
      
      ## Add Top Left plot
      plot(DayData$Global_active_power,type="l", xlab="", 
           ylab="Global Active Power (kilowatts)", xaxt="n")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Add Top Right plot
      plot(DayData$Voltage, type = "l", xlab = "datetime", ylab="Votlage", xaxt="n")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Add the Bottom Left plot
      plot(DayData$Sub_metering_1, type="l", xlab="", 
           ylab="Energy sub metering", xaxt="n", col = "black")
      lines(DayData$Sub_metering_2,type="l", col = "red")
      lines(DayData$Sub_metering_3,type="l", col = "blue")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Add the legend to the top right corner
      legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col=c("black", "red", "blue"), lty=c(1,1,1),  bty="n")
      
      ## Add the Bottom Right plot
      plot(DayData$Global_reactive_power,type="l", xlab="datetime", 
           ylab="Global_reactive_power", xaxt="n")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Close the png file
      dev.off()
}