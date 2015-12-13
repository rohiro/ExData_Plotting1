#R Piazza Exploratory Data Analysis Dec 2015

#whatever folder you're in, that's the folder you drawfrom to get your data
#setwd("put in here whatever folder this file is in and take away the '#' ")
#you also need to have unzipped the household_power_consumption.txt from the zip file provided in the course

setwd("~/Dropbox/C/DSS/4EDA/ExData_Plotting1")
#Get the names
pcNames <- read.table("household_power_consumption.txt", colClasses = c("character"), nrows = 1, sep = ";")
#get the data from locations desired
pcData <- read.table("household_power_consumption.txt", colClasses = c("factor","character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric" ), nrows = 2880, sep = ";", skip = 66637, na.strings = c("?"))
#put in the correct names
names(pcData) <- pcNames

#change date to format of date
pcData$Date <- as.Date(pcData$Date, format = "%d/%m/%Y")
#change time to format POSIXct
pcData$Time <- as.POSIXct(paste(pcData$Date, pcData$Time), tz = "GMT", format="%Y-%m-%d %H:%M:%S")

#Plot 4
png(filename = "plot4.png", bg = "transparent")
#split into four parts
par(mfrow = c(2,2))
#fig 1
plot(pcData$Time, pcData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#fig 2
plot(pcData$Time, pcData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#fig 3
plot(pcData$Time, pcData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
with(pcData, lines(pcData$Time, pcData$Sub_metering_2, col = "red"))
with(pcData, lines(pcData$Time, pcData$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lty = c(1,1,1), bty = "n")
#fig 4
plot(pcData$Time, pcData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
