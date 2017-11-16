dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
d <- dat[dat$Date == "2007-02-01",]
w <- dat[dat$Date == "2007-02-02",]
data <- rbind(d,w)

library(lubridate)
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
data$Date <- wday(as.Date(data$Date,'%Y-%m-%d'), label = TRUE)
plot(Global_active_power ~ datetime, data = data, type= 'l', 
     ylab = "Global Active Power (killowatts)", xlab = "")

dev.copy(png,'plot2.png', height = 480, width = 480)
dev.off()


