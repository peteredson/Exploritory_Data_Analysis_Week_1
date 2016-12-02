setwd("/Users/edsonfamily/Desktop/Coursera/4-Exploritory Data Analysis/Week1")
getwd()
#used or favorite packages
require(dplyr)
require(lubridate)
#reading in data source
power <- read.table("/Users/edsonfamily/Desktop/Coursera/4-Exploritory Data Analysis/Week1/household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, na.strings = "?")
#Checking for na's
Counts <- as.data.frame(sapply(power, function(power) sum(is.na(power))))
#limiting on Data
power_slim <-rbind(power[power$Date=="1/2/2007",],power[power$Date=="2/2/2007",])
#Checking for na's
Counts_slim <- as.data.frame(sapply(power_slim, function(power_slim) sum(is.na(power_slim))))
#editing format and creation of new date time variable
power_slim$Date <- as.Date(power_slim$Date,"%d/%m/%Y")
power_slim<-cbind(power_slim, "DateTime" = as.POSIXct(paste(power_slim$Date, power_slim$Time)))
#Plot 3
with(power_slim, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(power_slim$Sub_metering_2 ~ power_slim$DateTime, col = 'Red')
lines(power_slim$Sub_metering_3 ~ power_slim$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()