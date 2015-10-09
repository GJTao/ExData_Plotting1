##Exploratory Data Analysis Project 1

##Output plot3.png

##read 2-day data of 2007/02/01 - 2007/02/02
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powerdata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = colNames)

##create a varaible to combine date and time
powerdata$datetime <- with(powerdata, paste(date, time))
powerdata$datetime <- as.POSIXct(powerdata$datetime, format = "%d/%m/%Y %H:%M:%S")

##png of submetering v.s. datetime
png(filename = "plot3.png", width = 480, height = 480)
with(powerdata, plot(datetime, sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(powerdata, lines(sub_metering_2 ~ datetime, col = "red"))
with(powerdata, lines(sub_metering_3 ~ datetime, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()