# Get dataset
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                        stringsAsFactors=FALSE, dec=".")

# Subset the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

# Convert dates
Datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# Plot 2nd
with(data, {
        plot(Datetime, Sub_metering_1, type="l", ylab="Energy Submetering"
             , xlab="")
        lines(Datetime, Sub_metering_2, type="l", col='Red')
        lines(Datetime, Sub_metering_3, type="l", col='Blue')
})

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1:3, lwd=2, col=c("black", "red", "blue"))

# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
