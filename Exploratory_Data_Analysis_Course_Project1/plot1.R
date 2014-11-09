# Get dataset
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                        stringsAsFactors=FALSE, dec=".")

# Subset the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

# Plot 1st
hist(as.numeric(data$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()