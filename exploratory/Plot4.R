library(data.table)
cons <- fread("./consumption.txt", na.strings="?")
feb07con <- subset(cons, (Date == "2/2/2007") | (Date == '1/2/2007'))
#Plot 4
png(filename = "Plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)
dateTime   <- as.POSIXlt(paste(as.Date(feb07con$Date, format="%d/%m/%Y"), feb07con$Time, sep=" "))

par(mfrow = c(2,2)) 
#1,1
plot(dateTime, feb07con$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#1,2
plot(dateTime, feb07con$Voltage, type="l", xlab="datetime", ylab="Voltage")
#2,1
plot(dateTime, feb07con$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dateTime, feb07con$Sub_metering_2, type="l", col="red")
points(dateTime, feb07con$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty="n")
#2,2
plot(dateTime, feb07con$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()