dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
d <- dat[dat$Date == "2007-02-01",]
w <- dat[dat$Date == "2007-02-02",]
data <- rbind(d,w)

hist(as.numeric(as.character(data$Global_active_power)), main="Global Active Power", 
     xlab="Global Active Power (killowatts)", col = 'red')

dev.copy(png,'plot1.png', height = 480, width = 480)
dev.off()