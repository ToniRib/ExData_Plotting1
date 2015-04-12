plot1 <- function(directory = getwd()){
      ## plot1 takes the directory of the household_power_consumption.txt file from
      ## the user and returns a histogram of Global Active Power in kilowatts for
      ## February 1, 2007 to February 2, 2007 into a png file named 'plot1.png.'
      ## If the user did not provide a directory, the function will use the 
      ## current working directory as a default.
      
      ## Function call:
      ## plot1()                  Uses working directory
      ## plot1("C:/R/Projects")   Uses directory C:/R/Projects
      
      ## Original code written by Toni M Rib, April 11 2015.
      ## ----------------------------------------------------------------------------
      
      ## Create the filepath to the household power consumption file
      filepath <- paste(directory, "household_power_consumption.txt", sep="/")
      
      ## Read in the data from the specified directory
      eData <- read.table(filepath, header=TRUE, sep=";", na.strings="?")
      
      ## Get only the data from 2/1/2007 and 2/2/2007
      ## Note: Date is in the format d/m/yyyy in the dataset
      DayData <- eData[eData$Date == "1/2/2007" | eData$Date == "2/2/2007", ]
      
      ## Open the png file with size 480 x 480
      png(filename = "plot1.png", width = 480, height = 480)
      
      ## Create plot1
      hist(DayData$Global_active_power,breaks=15,col="red",main="Global Active Power",
           xlab="Global Active Power (kilowatts)", ylab = "Frequency",
           xaxt="n",yaxt="n")
      
      ## Add the x and y axes with the correct tick marks
      axis(side=1, at=c(0,2,4,6))
      axis(side=2, at=c(0,200,400,600,800,1000,1200))
      
      ## Close the png file
      dev.off()
}
     