##Exploratory Data Analysis Project 1

##Output plot1.png

##read 2-day data of 2007/02/01 - 2007/02/02
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
powerdata <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", col.names = colNames)

##png of histgram for the variable: global active power
png(filename = "plot1.png", width = 480, height = 480)
with(powerdata, hist(global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.off()