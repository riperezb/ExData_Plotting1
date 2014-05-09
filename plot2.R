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
plot(dataHouse$DateTime,dataHouse$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save the plot in a png file
dev.copy(device=png, file="figure/plot2.png", width = 480, height = 480)
dev.off()