data <- read.table(
  unz("exdata_data_household_power_consumption.zip",
      "household_power_consumption.txt"
  ),sep=";",header=TRUE,na.strings = "?")

library(lubridate)

data <- data[(dmy(data$Date)>=ymd("2007-02-1")) & (dmy(data$Date)<=ymd("2007-02-02")),]

data$lubridate <- dmy_hms(paste(data$Date,data$Time))

png("plot2.png")


plot(data$lubridate,data$Global_active_power,xlab="",ylab = "Global Active Power (kilowatts)",type="l")

dev.off()


