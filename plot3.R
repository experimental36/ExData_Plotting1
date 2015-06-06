library(data.table)
power_data <- read.table("power_data.txt", nrows = 69600, sep = ";", head = TRUE)
power_table <- data.frame(power_data)
power_sub <- power_table[66637:69516,]

sub1 <- as.numeric(as.vector(power_sub$Sub_metering_1))
sub2 <- as.numeric(as.vector(power_sub$Sub_metering_2))
sub3 <- as.numeric(as.vector(power_sub$Sub_metering_3))


Sys.setlocale("LC_TIME", "eng")

merged <- cbind(paste(power_sub$Date,power_sub$Time))
converted <- as.POSIXct(merged, format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

par(mar = c(3,4,2,1))
plot(converted, sub1, type="l", ylab = "Energy sub metering")
lines(converted, sub2, col="red")
lines(converted, sub3, col="blue")

legend("topright", lty =1 , col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()