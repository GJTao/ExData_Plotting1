##Exploratory Data Analysis Project 1

##Output plot2.png

##read 2-day data of 2007/02/01 - 2007/02/02
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powerdata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = colNames)

##create a varaible to combine date and time
powerdata$datetime <- with(powerdata, paste(date, time))
powerdata$datetime <- as.POSIXct(powerdata$datetime, format = "%d/%m/%Y %H:%M:%S")

##png of global active power v.s. datetime
png(filename = "plot2.png", width = 480, height = 480)
with(powerdata, plot(datetime, global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))
dev.off()