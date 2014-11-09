# Get dataset
data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                        stringsAsFactors=FALSE, dec=".")

# Subset the data
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007"),]

# Convert dates
Datetime <- strptime(paste(data$Date, data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# Plot 2nd
par(mfrow = c(2, 2))
with(data, {
        plot(Datetime, Global_active_power, type="l", 
             ylab="Global Active Power", xlab="", cex=0.2)
        plot(Datetime, Voltage, type="l", ylab="Voltage", xlab="datetime")
        plot(Datetime, Sub_metering_1, type="l", 
             ylab="Energy Submetering", xlab="")
        lines(Datetime, Sub_metering_2, col='Red')
        lines(Datetime, Sub_metering_3, col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Datetime, Global_reactive_power, type="l", 
             ylab="Global_reactive_power",xlab="datetime")
})

# Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()