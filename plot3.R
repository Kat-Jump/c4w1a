##### Objective: to complete c4w1a1
##### Author: "Kat-Jump"
##### Date: "4/17/2019"
##### Input:household_power_consumption.txt (at http://archive.ics.uci.edu/ml/index.php)
##### Output: plot3.png

#set working directory
setwd("/Volumes/GoogleDrive/My Drive/13Knowledge/DataScience/JhuDS/04Exploratory Data Analysis/Assignment")
getwd()

#read relevant data
install.packages("data.table")
library("data.table")
all<-fread("household_power_consumption.txt", na.strings="?")
head(all)
SelectedRows<-grep("^[1|2]/2/2007", as.character(all$Date))
twodays<-all[SelectedRows,c(1:3, 7:9)]
head(twodays)
x1 <- paste(twodays$Date, twodays$Time)
x<-strptime(x1, "%d/%m/%Y %H:%M:%S")
head(x)

#third graph
quartz()
par(mar=c(5,5,5,2))
plot(x, twodays$Sub_metering_1, type="l", main = "", xlab="", ylab="Energy sub metering")
lines(x, twodays$Sub_metering_2, col="red")
lines(x, twodays$Sub_metering_3, col="blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off() 