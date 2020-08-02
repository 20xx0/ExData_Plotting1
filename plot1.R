rawData <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

data <- rawData
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

# Plot 1
# Frequency of Global Active Power values

png(filename = "plot1.png", width = 480, height = 480)
par("mfcol"=c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()