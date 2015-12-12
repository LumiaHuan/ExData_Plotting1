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

png("./plot1.png")

hist(data_20070102$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()