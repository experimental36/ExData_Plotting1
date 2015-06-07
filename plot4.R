library(data.table)
power_data <- read.table("household_power_consumption.txt", nrows = 69600, sep = ";", head = TRUE)
power_table <- data.frame(power_data)
power_sub <- power_table[66637:69516,]

Sys.setlocale("LC_TIME", "eng")

merged <- cbind(paste(power_sub$Date,power_sub$Time))
converted <- as.POSIXct(merged, format="%d/%m/%Y %H:%M:%S")

new_global_active_power <- as.numeric(as.vector(power_sub$Global_active_power))
voltage <- as.numeric(as.vector(power_sub$Voltage))
sub1 <- as.numeric(as.vector(power_sub$Sub_metering_1))
sub2 <- as.numeric(as.vector(power_sub$Sub_metering_2))
sub3 <- as.numeric(as.vector(power_sub$Sub_metering_3))
new_global_reactive_power <- as.numeric(as.vector(power_sub$Global_reactive_power))

png("plot4.png", width=480, height=480)


par(mfrow = c(2, 2))

par(mar = c(6,4,2,2))
plot(converted, new_global_active_power, type="l", xlab = "", ylab = "Global Active Power")

par(mar = c(6,4,2,2))
plot(converted, voltage, type="l", xlab = "datetime", ylab = "Voltage")

par(mar = c(6,4,2,2))
plot(converted, sub1, type="l", ylab = "Energy sub metering")
lines(converted, sub2, col="red")
lines(converted, sub3, col="blue")
legend("topright", lty =1 , bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mar = c(6,4,2,2))
plot(converted, new_global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()