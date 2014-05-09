## Read data
## Read text file. Create a data.table
require(data.table)
dataHouse <- fread("dataHouse.txt", sep=";")

## Change columns type
dataHouse[, DateTime:=as.POSIXct(DateTime, format="%d/%m/%Y %H:%M:%S")]
dataHouse[, Global_active_power:=as.numeric(Global_active_power)]
dataHouse[, Global_reactive_power:=as.numeric(Global_reactive_power)]
dataHouse[, Voltage:=as.numeric(Voltage)]
dataHouse[, Global_intensity:=as.numeric(Global_intensity)]
dataHouse[, Sub_metering_1:=as.numeric(Sub_metering_1)]
dataHouse[, Sub_metering_2:=as.numeric(Sub_metering_2)]
dataHouse[, Sub_metering_3:=as.numeric(Sub_metering_3)]

## Create a plot
par(mfrow = c(2, 2), mar = c(5, 4, 0, 1), oma = c(0, 0, 1, 0))
with(dataHouse, {
    plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_1, col="black")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", lty=1, pt.cex=1, cex=0.6, text.width=strwidth("Sub_metering_1"), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
    
})
    
## Save the plot in a png file
dev.copy(device=png, file="figure/plot4.png", width = 480, height = 480)
dev.off()