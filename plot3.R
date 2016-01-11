hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                    sep = ";")

hpc_date_time <- paste(hpc$Date, hpc$Time)
hpc_posix <- strptime(hpc_date_time, "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(hpc_posix, hpc$Sub_metering_1, 
     xlab="", ylab = "Energy sub metering", 
     type = "l", col="red")
lines(hpc_posix, hpc$Sub_metering_2, col="green")
lines(hpc_posix, hpc$Sub_metering_3, col="blue")

legend("topright", lty = 1, 
       col=c("red", "green", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()