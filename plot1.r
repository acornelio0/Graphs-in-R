#Plot 1

#read the data in from the file (2,075,259 x 9)
Data <- fread("household_power_consumption.txt")

#selected 2 days of data Feb 1st, 2007, and Feb 2nd, 2007. (2880 x 9)
#Dates in %d/%m/%Y
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data2Days <- Data[ Data$Date %in% as.Date(c('2007-02-01' , '2007-02-02'))]

#open the PNG file: Plot1.png
png(file = "Plot1.png", width=480, height=480)

hist(as.numeric(Data2Days$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()  #close the file