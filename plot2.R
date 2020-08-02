rawData <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

data <- rawData
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

# Plot 2
# Plot Global Active Powers in time, weekdays on x axis

data$Global_active_power <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(rawData$Date, rawData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
par("mfcol"=c(1,1))
plot.default(x=datetime,y=data$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)",main="")
dev.off()