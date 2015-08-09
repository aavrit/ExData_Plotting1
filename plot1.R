full_data <- read.table(file = "data/household_power_consumption.txt", header = TRUE, sep = ";", 
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                        stringsAsFactors =  FALSE, na.strings = '?')
final_data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
rm(full_data)

png(filename = "plot1.png", width=480, height = 480)

hist(final_data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()