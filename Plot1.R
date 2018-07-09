
setwd("C:/ECONOMETRICS/Exporatory Data Analysis")
mydata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

png(filename = 'plot1.png', width = 480, height = 480, units='px')
with(mydata, hist(Global_active_power, col = "red", xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power'))
dev.off()