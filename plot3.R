power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
power$Time <- strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
test <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
test$Global_active_power <- as.numeric(as.character(test$Global_active_power))

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
par(mar=c(4,4,4,4))
plot(test$Time, test$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab = "")
lines(test$Time, test$Sub_metering_1)
lines(test$Time, test$Sub_metering_2, col="RED")
lines(test$Time, test$Sub_metering_3, col="BLUE")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black", "RED", "blue"))
dev.off()