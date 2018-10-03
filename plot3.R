#Add for parsing functions
library(lubridate)

#Load Table and subset to specified dates
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
data<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

#Parse 'Date', 'Time' and combine into 'DateTime'
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

#Create new field with Date, Time combined
data$DateTime<-data$Date+data$Time

#Create Plot3
png(filename="plot3.png", width=480, height=480, bg = "transparent")
with(data, plot(DateTime, Sub_metering_1, type = "l", ylab="Energy sub metering", xlab=""))
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()