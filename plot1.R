data <- read.table(
  unz("exdata_data_household_power_consumption.zip",
      "household_power_consumption.txt"
      ),sep=";",header=TRUE,na.strings = "?")

library(lubridate)

data <- data[(dmy(data$Date)>=ymd("2007-02-1")) & (dmy(data$Date)<=ymd("2007-02-02")),]

png("plot1.png")

hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main="Global Active Power")
dev.off()
