library(dplyr)

#find and clean table
setwd("/Users/josephaddonisio/Downloads/Cousera")
filepath <- "./Exploratory Data Analysis/household_power_consumption.txt"
dataset <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newdataset<-filter(dataset,Date == "1/2/2007" | Date =="2/2/2007")

#define variables
g.a.power <- as.numeric(newdataset$Global_active_power)

#plot histogram
png("plot1.png", width=480, height=480)
hist(g.a.power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
