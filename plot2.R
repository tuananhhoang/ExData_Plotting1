library(data.table)

# Load Household power consumption data and unzip it if household_power_consumption.txt does not exist
if (!("household_power_consumption.txt" %in% list.files())) {
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="household_power_consumption.zip", method="curl", extra="-k")
    unzip("household_power_consumption.zip")
}

# Data loading and filtering
suppressWarnings(data <- fread("household_power_consumption.txt", header=T, sep=";"))
data <- data[which(Date=="1/2/2007" | Date=="2/2/2007"),]

# Open PNG device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Draw the required plot
plot(as.numeric(data$Global_active_power), type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n")
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# Close PNG device
dev.off()