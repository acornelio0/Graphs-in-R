#Plot 2

#read the data in from the file (2,075,259 x 9)
Data <- fread("household_power_consumption.txt")
 
#selected 2 days of data Feb 1st, 2007, and Feb 2nd, 2007. (2880 x 9)
#Dates in %d/%m/%Y
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data2Days <- Data[ Data$Date %in% as.Date(c('2007-02-01' , '2007-02-02'))]

#construct the Timestamps for the data
DateTime = paste(Data2Days$Date, Data2Days$Time)
TimeStamps <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

#open the PNG file: Plot2.png
png(file = "Plot2.png", width=480, height=480)

plot(TimeStamps, Data2Days$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(TimeStamps, Data2Days$Global_active_power, type="l")

dev.off() #close the file