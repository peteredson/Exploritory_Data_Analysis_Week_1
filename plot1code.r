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
