#PLOT 1

#loading & subsetting the data
data_complete  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")
data <- subset(data_complete, Date >= "2007-02-01")
data <- subset(data, Date <= "2007-02-02")

#creating the plot
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#saving the plot to a png file
dev.copy(png, file = "plot1.png")
dev.off() 
