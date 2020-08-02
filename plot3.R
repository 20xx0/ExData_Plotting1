rawData <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

data <- rawData
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
datetime <- strptime(paste(rawData$Date, rawData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot 3
# Energy Sub Metering on y-axis, 1 = black, 2 = red, 3 = blue

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
par("mfcol"=c(1,1))
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()