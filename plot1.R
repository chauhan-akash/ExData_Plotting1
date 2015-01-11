power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(power$Time,"%H:%M:%S")
test <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
test$Global_active_power <- as.numeric(as.character(test$Global_active_power))
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar=c(4,4,4,4))
hist(test$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="RED")
dev.off()