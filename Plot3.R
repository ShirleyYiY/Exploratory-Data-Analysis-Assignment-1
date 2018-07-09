
setwd("C:/ECONOMETRICS/Exporatory Data Analysis")
mydata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(paste(mydata$Date,mydata$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png("Plot3.png", width = 480, height = 480, units = "px")
plot(mydata$Time, mydata$Sub_metering_1, xlab = '', ylab = "Energy sub metering", type = "l")
lines(mydata$Time, mydata$Sub_metering_2, col = "red")
lines(mydata$Time, mydata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()