full_data <- read.table(file = "data/household_power_consumption.txt", header = TRUE, sep = ";", 
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        stringsAsFactors =  FALSE, na.strings = '?')
final_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
rm(full_data)

final_data$Date <- as.Date(final_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(final_data$Date), final_data$Time)
final_data$DateTime <- as.POSIXct(datetime)

png(filename = "plot2.png", width=480, height = 480)

plot(final_data$DateTime, final_data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()