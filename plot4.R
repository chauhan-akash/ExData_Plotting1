power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
power$Time <- strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
test <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
test$Global_active_power <- as.numeric(as.character(test$Global_active_power))
test$Voltage <- as.numeric(as.character(test$Voltage))
test$Global_reactive_power <- as.numeric(as.character(test$Global_reactive_power))

png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mar=c(4,4,4,4), mfrow=c(2,2))

#plot 1
plot(test$Time, test$Global_active_power, type = "n", ylab="Global Active Power (kilowatts)", xlab = "")
lines(test$Time, test$Global_active_power)

#plot 2
plot(test$Time, test$Voltage, type = "n", ylab="voltage", xlab = "datetime")
lines(test$Time, test$Voltage)

#plot 3
plot(test$Time, test$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab = "")
lines(test$Time, test$Sub_metering_1)
lines(test$Time, test$Sub_metering_2, col="RED")
lines(test$Time, test$Sub_metering_3, col="BLUE")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black", "RED", "blue"))

#plot 4
plot(test$Time, test$Global_reactive_power, type = "n", ylab="Global_reactive_power", xlab = "datetime")
lines(test$Time, test$Global_reactive_power)

dev.off()
