library(dplyr)

#find and clean table
setwd("/Users/josephaddonisio/Downloads/Cousera")
filepath <- "./Exploratory Data Analysis/household_power_consumption.txt"
dataset <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newdataset<-filter(dataset,Date == "1/2/2007" | Date =="2/2/2007") 

#define variables
g.a.power<- as.numeric(newdataset$Global_active_power)
date.clean<- strptime(paste(newdataset$Date, newdataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub.metering1 <- as.numeric(newdataset$Sub_metering_1)
sub.metering2 <- as.numeric(newdataset$Sub_metering_2)
sub.metering3 <- as.numeric(newdataset$Sub_metering_3)

#plot the plot copmaring sub metering; legend included
png("plot3.png", width=480, height=480)
plot(date.clean, sub.metering1, type="l", ylab="Energy sub metering", xlab="")
lines(date.clean, sub.metering2, type="l", col="red")
lines(date.clean, sub.metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
