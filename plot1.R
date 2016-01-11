library(sqldf)

hpc <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                    sep = ";")
png("plot1.png")

hist(hpc$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()