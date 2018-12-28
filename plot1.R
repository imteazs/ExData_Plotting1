#loading the data
myData <- read.table('/home/learnimteaz/Documents/ExpDataAnalysis/lesson1/household_power_consumption.txt', 
                     header = TRUE, sep = ';', na.strings = '?')

#Manipulating and filtering the data
dayOneData <- subset(myData, Date == '1/2/2007')
dayTwoData <- subset(myData, Date == '2/2/2007')
reformData <- rbind(dayOneData, dayTwoData)

#plotting the data together
gtable <- reformData$Global_active_power
png(filename = '/home/learnimteaz/Documents/ExpDataAnalysis/lesson1/plot1.png')
hist(gtable, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()