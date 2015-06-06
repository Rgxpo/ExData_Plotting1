library(data.table)
cons <- fread("./consumption.txt", na.strings="?")
feb07con <- subset(cons, (Date == "2/2/2007") | (Date == '1/2/2007'))
#plot 1

png(filename = "Plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

hist(as.numeric(feb07con$Global_active_power), main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.off()
