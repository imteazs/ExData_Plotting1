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

#plotting
png(filename = '/home/learnimteaz/Documents/ExpDataAnalysis/lesson1/plot2.png')
plot(mydate, reformData$Global_active_power, type = 'l', xlab = 'time', ylab = 'Global Active Power (kilowatts)')
dev.off()