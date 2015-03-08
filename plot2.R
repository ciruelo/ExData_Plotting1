#PLOT 2

#loading & subsetting the data
data_complete  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")
data <- subset(data_complete, Date >= "2007-02-01")
data <- subset(data, Date <= "2007-02-02")

#creating the x variable
date_time <- paste(data$Date, data$Time)
data$date_time <- as.POSIXct(date_time)

#creating the plot
plot(data$Global_active_power~data$date_time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#saving the plot to a png file
dev.copy(png, file = "plot2.png")
dev.off() 
