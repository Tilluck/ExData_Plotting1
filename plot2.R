library("data.table")
power_1 <- data.table::fread(input = "exdata_data_household_power_consumption/household_power_consumption.txt"
                             , na.strings="?"
)
power_1[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

power_1 <- power_1[(date_Time >= "2007-02-01") & (date_Time < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = power_1[, date_Time], y = power_1[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
