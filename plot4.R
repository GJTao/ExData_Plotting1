##Exploratory Data Analysis Project 1

##Output plot4.png

##read 2-day data of 2007/02/01 - 2007/02/02
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powerdata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = colNames)

##create a varaible to combine date and time
powerdata$datetime <- with(powerdata, paste(date, time))
powerdata$datetime <- as.POSIXct(powerdata$datetime, format = "%d/%m/%Y %H:%M:%S")

##png of 4 variables v.s. datetime
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))

##Global Acitivity Power 
with(powerdata, plot(datetime, global_active_power, ylab = "Global Active Power", xlab = "", type = "l"))

##voltage
with(powerdata, plot(datetime, voltage, ylab = "Voltage", type = "l"))

##Sub metering
with(powerdata, plot(datetime, sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(powerdata, lines(sub_metering_2 ~ datetime, col = "red"))
with(powerdata, lines(sub_metering_3 ~ datetime, col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Global Reacitivity Power 
with(powerdata, plot(datetime, global_reactive_power, ylab = "Global Reactivity Power", type = "l"))

dev.off()