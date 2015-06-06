#Plot 2 script

#Read power data
power_data = read.table("~/household_power_consumption.txt", header = TRUE, sep =";",na.strings="?")

#Subset to  2007-02-01 and 2007-02-02
power_data = power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]


#format time
power_data$date_time = paste(power_data$Date, power_data$Time)
power_data$date_time = strptime(power_data$date_time, "%d/%m/%Y %H:%M:%S")

png('~/ExData_Plotting1/plot2.png', width=480, height=480)

#Plot line chart of global active power by time
plot (power_data$date_time,power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()