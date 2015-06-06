library(data.table)
cons <- fread("./consumption.txt", na.strings="?")
feb07con <- subset(cons, (Date == "2/2/2007") | (Date == '1/2/2007'))
#Plot2 
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)
dateTime   <- as.POSIXlt(paste(as.Date(feb07con$Date, format="%d/%m/%Y"), feb07con$Time, sep=" "))
plot(dateTime, feb07con$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

