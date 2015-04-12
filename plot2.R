plot2 <- function(directory = getwd()){
      ## plot2 takes the directory of the household_power_consumption.txt file from
      ## the user and returns a basic line plot of Global Active Power in kilowatts
      ## versus time for February 1, 2007 to February 2, 2007 into a 
      ## png file named 'plot2.png.'
      ## If the user did not provide a directory, the function will use the 
      ## current working directory as a default.
      
      ## Function call:
      ## plot2()                  Uses working directory
      ## plot2("C:/R/Projects")   Uses directory C:/R/Projects
      
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
      png(filename = "plot2.png", width = 480, height = 480)
      
      ## Create plot2
      plot(DayData$Global_active_power,type="l", xlab="", 
           ylab="Global Active Power (kilowatts)", xaxt="n")
      
      ## Add the x axis with the correct tick marks
      axis(side=1, at=c(0, 1440,2880), labels=c("Thu", "Fri", "Sat"))
      
      ## Close the png file
      dev.off()
}