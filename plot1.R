library(data.table)
power_data <- read.table("household_power_consumption.txt", nrows = 69600, sep = ";", head = TRUE)
power_table <- data.frame(power_data)
power_sub <- power_table[66637:69516,]

new_global_active_power <- as.numeric(as.vector(power_sub$Global_active_power))
hist(new_global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()