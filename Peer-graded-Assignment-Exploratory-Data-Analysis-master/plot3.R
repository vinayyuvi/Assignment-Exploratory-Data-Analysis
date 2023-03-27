rm(list=ls())
cat("\014")

# Load dataset with NA string = ?
dataset = read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

# Converting the Date and Time variables
dataset$dt = strptime(paste(dataset$Date,dataset$Time),"%d/%m/%Y %H:%M:%S")
dataset$Date = as.Date(dataset$Date,"%d/%m/%Y")

# Subsetting dataset for specified time period: 2007-02-01 and 2007-02-02
datasubset = subset(dataset,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 3:
png("plot3.png", width=480, height=480)

plot(datasubset$dt,datasubset$Sub_metering_1,type = "l",xlab = "",
     ylab = "Energy sub metering")

points(datasubset$dt,datasubset$Sub_metering_2,type = "l",
       col = "red")

points(datasubset$dt,datasubset$Sub_metering_3,type = "l",
       col = "blue")


legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
