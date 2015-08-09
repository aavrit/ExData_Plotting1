full_data <- read.table(file = "data/household_power_consumption.txt", header = TRUE, sep = ";", 
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        stringsAsFactors =  FALSE, na.strings = '?')
final_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
rm(full_data)

final_data$Date <- as.Date(final_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(final_data$Date), final_data$Time)
final_data$DateTime <- as.POSIXct(datetime)

png(filename = "plot4.png", width=480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(final_data, {
    plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
    plot(DateTime, Voltage, type="l", ylab="Voltage (volt)", xlab="")
    
    plot(DateTime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(DateTime, Sub_metering_2,col='Red')
    lines(DateTime, Sub_metering_3,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(DateTime, Global_reactive_power, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()