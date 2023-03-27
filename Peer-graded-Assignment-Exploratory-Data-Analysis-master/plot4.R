rm(list=ls())
cat("\014")

# Load dataset with NA string = ?
dataset = read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

# Converting the Date and Time variables
dataset$dt = strptime(paste(dataset$Date,dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date = as.Date(dataset$Date,"%d/%m/%Y")

# Subsetting dataset for specified time period: 2007-02-01 and 2007-02-02
datasubset = subset(dataset,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 4:
png("plot4.png", width=480, height=480)
layout(matrix(1:4, nrow = 2, ncol = 2))
plot(datasubset$dt,datasubset$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
plot(datasubset$dt,datasubset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
points(datasubset$dt,datasubset$Sub_metering_2,type = "l",col = "red")
points(datasubset$dt,datasubset$Sub_metering_3,type = "l",col = "blue")
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",cex = 0.8)
plot(datasubset$dt,datasubset$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(datasubset$dt,datasubset$Global_reactive_power,type = "l",xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
