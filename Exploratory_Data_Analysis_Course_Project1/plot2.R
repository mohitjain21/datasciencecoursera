# Get dataset
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                        stringsAsFactors=FALSE, dec=".")

# Subset the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

# Convert dates
Datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# Plot 2nd
plot(Datetime, as.numeric(data$Global_active_power), type="l", xlab="",
      ylab="Global Active Power (kilowatts)")

# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()