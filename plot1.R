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

#Plot 1
png(filename = "plot1.png", bg = "transparent")
hist(pcData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)");
dev.off()

