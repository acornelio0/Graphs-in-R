#Plot 4

#read the data in from the file (2,075,259 x 9)
Data <- fread("household_power_consumption.txt")
 
#selected 2 days of data Feb 1st, 2007, and Feb 2nd, 2007. (2880 x 9)
#Dates in %d/%m/%Y
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data2Days <- Data[Data$Date %in% as.Date(c('2007-02-01' , '2007-02-02'))]

#construct the Timestamps for the data
DateTime = paste(Data2Days$Date, Data2Days$Time)
TimeStamps <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

#open the PNG file: Plot4.png
png(file = "Plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(TimeStamps, Data2Days$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(TimeStamps, Data2Days$Global_active_power, col="black")
 
plot(TimeStamps, Data2Days$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(TimeStamps, Data2Days$Voltage, col="black")

plot(TimeStamps, Data2Days$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(TimeStamps, Data2Days$Sub_metering_3, col="blue")
lines(TimeStamps, Data2Days$Sub_metering_2, col="red")
lines(TimeStamps, Data2Days$Sub_metering_1, col="black")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, bty="n")

plot(TimeStamps, Data2Days$Global_reactive_power, xlab="datetime", ylab="Global Reactive Power", type="n")
lines(TimeStamps, Data2Days$Global_reactive_power, col="black")

dev.off() #close the file