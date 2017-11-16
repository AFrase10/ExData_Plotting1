### subset data

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
d <- dat[dat$Date == "2007-02-01",]
w <- dat[dat$Date == "2007-02-02",]
data <- rbind(d,w)

library(lubridate)
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
data$Date <- wday(as.Date(data$Date,'%Y-%m-%d'), label = TRUE)


par(mfrow = c(2, 2), mar = c(5, 4, 2, 2), cex = 0.6)

###### Graph 1
plot(Global_active_power ~ datetime, data = data, type= 'l', 
     ylab = "Global Active Power", xlab = "")

######### graph 2

plot(Voltage ~ datetime, data = data, type= 'l', 
     ylab = "Voltage", xlab = "datetime")

names(data)

######## graph 3

plot(Sub_metering_1 ~ datetime, data = data, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, data = data, col = "Red")
lines(Sub_metering_3 ~ datetime, data= data, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

########### graph 4 
plot(Global_reactive_power ~ datetime, data = data, type= 'l', xlab = "datetime")


dev.copy(png,'plot4.png', height = 480, width = 480)
dev.off()