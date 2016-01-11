library(sqldf)

hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                    sep = ";")

hpc_date_time <- paste(hpc$Date, hpc$Time)
hpc_posix <- strptime(hpc_date_time, "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(hpc_posix, hpc$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()