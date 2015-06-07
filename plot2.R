library(data.table)
power_data <- read.table("household_power_consumption.txt", nrows = 69600, sep = ";", head = TRUE)
power_table <- data.frame(power_data)
power_sub <- power_table[66637:69516,]

new_global_active_power <- as.numeric(as.vector(power_sub$Global_active_power))
Sys.setlocale("LC_TIME", "eng")

merged <- cbind(paste(power_sub$Date,power_sub$Time))
converted <- as.POSIXct(merged, format="%d/%m/%Y %H:%M:%S")

par(mar = c(3,4,2,1))
plot(converted, new_global_active_power, type="l", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()