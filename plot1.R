#Plot 1 script

#Read power data
power_data = read.table("~/household_power_consumption.txt", header = TRUE, sep =";",na.strings="?")

#Subset to  2007-02-01 and 2007-02-02
power_data = power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]


png('~/ExData_Plotting1/plot1.png', width=480, height=480)

#make histogram plot
hist(power_data$Global_active_power,col="red",breaks=12, main ="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()