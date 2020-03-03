data <- read.table(
  unz("exdata_data_household_power_consumption.zip",
      "household_power_consumption.txt"
  ),sep=";",header=TRUE,na.strings = "?")

library(lubridate)

data <- data[(dmy(data$Date)>=ymd("2007-02-1")) & (dmy(data$Date)<=ymd("2007-02-02")),]

data$lubridate <- dmy_hms(paste(data$Date,data$Time))


png("plot4.png")
par(mfrow=c(2,2))

plot(data$lubridate,data$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type="l")

plot(data$lubridate,data$Voltage,xlab="datetime",ylab = "Voltage",type="l")

plot(data$lubridate,data$Sub_metering_1,xlab="",ylab = "Energy sub metering",type="l")
points(data$lubridate,data$Sub_metering_2,type="l",col="red")
points(data$lubridate,data$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,box.lty=0)

plot(data$lubridate,data$Global_reactive_power,xlab="datetime",ylab = "Global_reactive_power",type="l")

dev.off()