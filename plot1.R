## plot1.R

## ***********************
## Load and transform data
## ***********************
# Load data
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes)
head(data)
str(data)

# Transform Date and Time in a class Date
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y %H:%M:%S")
head(data)
str(data)

# Select data between 201-02-01 and 2007-02-02
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

## **************
## Create graphic
## **************
# View the histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "orangered")
# Create the histogram and save it as png
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "orangered")
dev.off()
