dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
d <- dat[dat$Date == "2007-02-01",]
w <- dat[dat$Date == "2007-02-02",]
data <- rbind(d,w)

plot(Sub_metering_1 ~ datetime, data = data, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, data = data, col = "Red")
lines(Sub_metering_3 ~ datetime, data= data, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot3.png', height = 480, width = 480)
dev.off()