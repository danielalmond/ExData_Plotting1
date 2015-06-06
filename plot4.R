#Plot 4 script

#Read power data
power_data = read.table("~/household_power_consumption.txt", header = TRUE, sep =";",na.strings="?")

#Subset to  2007-02-01 and 2007-02-02
power_data = power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]


#format time
power_data$date_time = paste(power_data$Date, power_data$Time)
power_data$date_time = strptime(power_data$date_time, "%d/%m/%Y %H:%M:%S")


png('~/ExData_Plotting1/plot4.png', width=480, height=480)

#set mfrow to a 2x2 chart
par(mfrow = c(2,2))
par(mar=c(4.1,4.1,1.1,1.1))
#Plot line chart of global active power by time
plot (power_data$date_time,power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

 
#Plot line chart of global active power by time
plot (power_data$date_time,power_data$Voltage, type="l", xlab="", ylab="Voltage")
#Plot line chart of Energy Sub Metering 1 by time in black
plot (power_data$date_time,power_data$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")

#Add in line chart of Energy Sub Metering 2 by time in red
points (power_data$date_time,power_data$Sub_metering_2, type="l", col="red")

#Add in line chart of Energy Sub Metering 3 by time in red
points (power_data$date_time,power_data$Sub_metering_3, type="l", col="purple")

#add in legend
legend("topright", col = c("black", "red","purple"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pch="-")

#Plot line chart of global active power by time
plot (power_data$date_time,power_data$Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power")

dev.off()