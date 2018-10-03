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

#Create Plot1
png(filename="plot1.png", width=480, height=480, bg = "transparent")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()