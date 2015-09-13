allData <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep=";", quote = "", 
                      na.strings = "?",  
                      stringsAsFactors = F, 
                      colClasses = c("character", "character", rep("numeric", 7)))

filteredData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]

filteredData <- within(filteredData, Datetime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)

plot(filteredData$Datetime, filteredData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
