power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
power$Time <- strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
test <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
test$Global_active_power <- as.numeric(as.character(test$Global_active_power))

png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar=c(4,4,4,4))
plot(test$Time, test$Global_active_power, type = "n", ylab="Global Active Power (kilowatts)", xlab = "")
lines(test$Time, test$Global_active_power)
dev.off()