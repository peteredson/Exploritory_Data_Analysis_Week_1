#####-----This Code produces the required plots for week 1-----#####
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
#Plot 1
hist(power_slim$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
#Plot 2
with(power_slim, plot(DateTime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
#Plot 3
with(power_slim, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(power_slim$Sub_metering_2 ~ power_slim$DateTime, col = 'Red')
lines(power_slim$Sub_metering_3 ~ power_slim$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
#Plot 4
par(mfrow=c(2,2))
plot(power_slim$Global_active_power ~ power_slim$DateTime, type="l")
plot(power_slim$Voltage ~ power_slim$DateTime, type="l")
with(power_slim, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(power_slim$Sub_metering_2 ~ power_slim$DateTime, col = 'Red')
lines(power_slim$Sub_metering_3 ~ power_slim$DateTime, col = 'Blue')
plot(power_slim$Global_reactive_power ~ power_slim$DateTime, type="l")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
#####-----End of Week 1 Code-----#####
