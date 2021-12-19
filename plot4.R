library("data.table")

power_1 <- data.table::fread(input = "exdata_data_household_power_consumption/household_power_consumption.txt"
                             , na.strings="?"
)
power_1[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

power_1 <- power_1[(date_Time >= "2007-02-01") & (date_Time < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(power_1[, date_Time], power_1[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(power_1[, date_Time],power_1[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(power_1[, date_Time], power_1[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_1[, date_Time], power_1[, Sub_metering_2], col = "red")
lines(power_1[, date_Time], power_1[, Sub_metering_3], col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty = 1, lwd = 1, cex = 0.5, bty = "n")

plot(power_1[, date_Time], power_1[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
