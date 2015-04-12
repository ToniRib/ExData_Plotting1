plot3 <- function(directory = getwd()){
      ## plot3 takes the directory of the household_power_consumption.txt file from
      ## the user and returns a line plot of each of the 3 submetering measurements
      ## versus time for February 1, 2007 to February 2, 2007 into a 
      ## png file named 'plot3.png.'
      ## If the user did not provide a directory, the function will use the 
      ## current working directory as a default.
      
      ## Function call:
      ## plot3()                  Uses working directory
      ## plot3("C:/R/Projects")   Uses directory C:/R/Projects
      
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
      png(filename = "plot3.png", width = 480, height = 480)
      
      ## Create plot3
      plot(DayData$Sub_metering_1, type="l", xlab="", 
           ylab="Energy sub metering", xaxt="n", col = "black")
      lines(DayData$Sub_metering_2,type="l", col = "red")
      lines(DayData$Sub_metering_3,type="l", col = "blue")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Add the legend to the top right corner
      legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col=c("black", "red", "blue"), lty=c(1,1,1))
      
      ## Close the png file
      dev.off()
}