#PLOT 3

#loading & subsetting the data
data_complete  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")
data <- subset(data_complete, Date >= "2007-02-01")
data <- subset(data, Date <= "2007-02-02")

#creating the x variable
date_time <- paste(data$Date, data$Time)
data$date_time <- as.POSIXct(date_time)

#creating the plot
with(data, plot(data$Sub_metering_1~data$date_time, type = "l", ylab = "Energy sub metering", xlab = ""))
        lines(data$Sub_metering_2~data$date_time, col = "red")
        lines(data$Sub_metering_3~data$date_time, col = "blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7, x.intersp = 0.5, y.intersp = 0.5)


#saving the plot to a png file
dev.copy(png, file = "plot3.png")
dev.off() 
