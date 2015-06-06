library(data.table)
cons <- fread("./consumption.txt", na.strings="?")
feb07con <- subset(cons, (Date == "2/2/2007") | (Date == '1/2/2007'))
#plot 3
png(filename = "Plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)
dateTime   <- as.POSIXlt(paste(as.Date(feb07con$Date, format="%d/%m/%Y"), feb07con$Time, sep=" "))
plot(dateTime, feb07con$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dateTime, feb07con$Sub_metering_2, type="l", col="red")
points(dateTime, feb07con$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'), col = c("black", "red", "blue"), lty = c(1, 1, 1) )
dev.off()
