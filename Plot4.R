
setwd("C:/ECONOMETRICS/Exporatory Data Analysis")
mydata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$datetime <- strptime(paste(mydata$Date,mydata$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png("Plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(mydata$datetime, mydata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(mydata$datetime, mydata$Voltage, xlab = "datetime", ylab = "voltage", type = "l")
plot(mydata$datetime, mydata$Sub_metering_1, xlab = '', ylab = "Energy sub metering", type = "l")
lines(mydata$datetime, mydata$Sub_metering_2, col = "red")
lines(mydata$datetime, mydata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
plot(mydata$datetime, mydata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()