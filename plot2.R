## plot2.R

Sys.setlocale(category = "LC_TIME", local = "C")

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

## ************************************************************
## Function to show the plot on screen or save it as a png file
## ************************************************************
myplot <- function(aspng = FALSE) {
  if(aspng == TRUE) {
    png("plot2.png", width = 480, height = 480)
  }
  
  plot(data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l", xaxt = 'n')
  ticks.at <- seq(0, 2880, length.out = 3)
  dates_labels <- c(strftime(min(data$Date), "%a"), strftime(max(data$Date), "%a"), strftime(max(data$Date) + 1, "%a"))
  axis(1, at = ticks.at , labels = dates_labels)
  
  if(aspng == TRUE) {
    dev.off()
  }
}

# View the plot
myplot()
# Save the plot as png file
myplot(aspng = TRUE)

