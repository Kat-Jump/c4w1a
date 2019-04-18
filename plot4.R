##### Objective: to complete c4w1a1
##### Author: "Kat-Jump"
##### Date: "4/17/2019"
##### Input:household_power_consumption.txt (at http://archive.ics.uci.edu/ml/index.php)
##### Output: plot4.png

#set working directory
setwd("/Volumes/GoogleDrive/My Drive/13Knowledge/DataScience/JhuDS/04Exploratory Data Analysis/Assignment")
getwd()

#read relevant data
install.packages("data.table")
library("data.table")
all<-fread("household_power_consumption.txt", na.strings="?")
head(all)
SelectedRows<-grep("^[1|2]/2/2007", as.character(all$Date))
twodays<-all[SelectedRows,c(1:5, 7:9)]
head(twodays)
x1 <- paste(twodays$Date, twodays$Time)
x<-strptime(x1, "%d/%m/%Y %H:%M:%S")
head(x)

#fourth graph
quartz()
par(mfcol=c(2,2), cex=0.7) #cex:A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default. This starts as 1 when a device is opened

plot(x, twodays$Global_active_power, type="l", main = "", xlab="", ylab="Global Active Power (Kilowatts)")

plot(x, twodays$Sub_metering_1, type="l", main = "", xlab="", ylab="Energy sub metering")
lines(x, twodays$Sub_metering_2, col="red")
lines(x, twodays$Sub_metering_3, col="blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), bty="n") #bty: border type

plot(x,twodays$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x,twodays$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off() 