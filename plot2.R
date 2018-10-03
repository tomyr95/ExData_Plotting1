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

#Create Plot2
png(filename="plot2.png", width=480, height=480, bg = "transparent")
with(data, plot(DateTime, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()