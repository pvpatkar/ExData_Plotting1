hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                    sep = ";")

hpc_date_time <- paste(hpc$Date, hpc$Time)
hpc_posix <- strptime(hpc_date_time, "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2), mar=c(5,5,2,1))

plot(hpc_posix, hpc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpc_posix, hpc$Voltage, xlab="datetime", ylab="Voltage", type = "l")

plot(hpc_posix, hpc$Sub_metering_1, 
     xlab="", ylab = "Energy sub metering", 
     type = "l", col="red")
lines(hpc_posix, hpc$Sub_metering_2, col="green")
lines(hpc_posix, hpc$Sub_metering_3, col="blue")
legend("topright", lty = 1, 
       col=c("red", "green", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc_posix, hpc$Global_reactive_power, type="l",
     xlab="", ylab="Global_reactive_power")

dev.off()