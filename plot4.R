#loading the data
myData <- read.table('/home/learnimteaz/Documents/ExpDataAnalysis/lesson1/household_power_consumption.txt', 
                     header = TRUE, sep = ';', na.strings = '?')

#Manipulating and filtering the data
dayOneData <- subset(myData, Date == '1/2/2007')
dayTwoData <- subset(myData, Date == '2/2/2007')
reformData <- rbind(dayOneData, dayTwoData)

#converting to days
dateTime <- paste(reformData$Date, reformData$Time)
mydate <- strptime(dateTime, format='%e/%m/%Y %H:%M:%S')

#generating plot window
png(filename = '/home/learnimteaz/Documents/ExpDataAnalysis/lesson1/plot4.png')
par(mfrow=c(2,2))
plot(mydate, reformData$Global_active_power, type = 'l', xlab = 'datetime', ylab = 'Global Active Power (kilowatts)')
plot(mydate, reformData$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(mydate, reformData$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab='')
lines(mydate, reformData$Sub_metering_2, col = 'red')
lines(mydate, reformData$Sub_metering_3, col = 'blue')
legend("topright",  legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty=1, lwd=1)
plot(mydate, reformData$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type='l')
dev.off()