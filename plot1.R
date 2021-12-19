library("data.table")

power_1 <- data.table::fread(input = "exdata_data_household_power_consumption/household_power_consumption.txt"
                             , na.strings="?"
)

power_1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

power_1 <- power_1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(power_1[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")



dev.off()
