#PLOT 4

#loading & subsetting the data
data_complete  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")
data <- subset(data_complete, Date >= "2007-02-01")
data <- subset(data, Date <= "2007-02-02")

#creating the x variable
date_time <- paste(data$Date, data$Time)
data$date_time <- as.POSIXct(date_time)

#creating the plot
par(mfrow = c(2,2))

plot(data$Global_active_power~data$date_time, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$Voltage~data$date_time, type = "l", ylab = "Voltage", xlab = "datetime")

with(data, plot(data$Sub_metering_1~data$date_time, type = "l", ylab = "Energy sub metering", xlab = ""))
        lines(data$Sub_metering_2~data$date_time, col = "red")
        lines(data$Sub_metering_3~data$date_time, col = "blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), 
               lty=1, lwd=1, bty = "n", cex = 0.7, x.intersp = 0.5, y.intersp = 0.5)

plot(data$Global_reactive_power~data$date_time, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
        axis(side=2, at=seq(0, 0.5, by=0.1))

#saving the plot to a png file
dev.copy(png, file = "plot4.png", heigh=600, width=600)
dev.off() 
