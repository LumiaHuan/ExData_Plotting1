url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!dir.exists("./data")){
  dir.create("./data")
}
zip_file_path <- "./data/electric_power_consumption.zip"
file_path <- "./data/electric_power_consumption.txt"
if(!file.exists("./data/electric_power_consumption.txt")){
  download.file(url, destfile = zip_file_path, method = "curl")
  unzip(zip_file_path, files = file_path)
}

data <- read.csv(file_path, sep=";", nrow = 2075260, na.strings="?", stringsAsFactors = FALSE)

data_20070102 <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

data_20070102$weekdays <- as.Date(data_20070102$Date, format="%d/%m/%Y")

data_20070102$weekdaysTime <- as.POSIXct(paste(data_20070102$weekdays, data_20070102$Time))

png("plot3.png")

plot(data_20070102$weekdaysTime, data_20070102$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_20070102$weekdaysTime, data_20070102$Sub_metering_2, col="red")
lines(data_20070102$weekdaysTime, data_20070102$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
