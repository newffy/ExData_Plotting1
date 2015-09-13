allData <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep=";", quote = "", 
                      na.strings = "?",  
                      stringsAsFactors = F, 
                      colClasses = c("character", "character", rep("numeric", 7)))

filteredData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]

filteredData <- within(filteredData, Datetime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))

plot(filteredData$Datetime, filteredData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(filteredData$Datetime, filteredData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(filteredData$Datetime, filteredData$Sub_metering_1, type = "l", col = "black")
points(filteredData$Datetime, filteredData$Sub_metering_2, type = "l", col = "red")
points(filteredData$Datetime, filteredData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(filteredData$Datetime, filteredData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(filteredData$Datetime, filteredData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
