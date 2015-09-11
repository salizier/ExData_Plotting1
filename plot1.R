#load file in order to get datas
source("data.R")

#init PNG file
data <- getData()

#init PNG file
png(file = "plot1.png", width = 480, height = 480)

#create full plot1
hist(data$Global_active_power, col="red",xlab="Global Active Power (kilowwatts)", main="Global Active Power")

#close PNG file
dev.off()