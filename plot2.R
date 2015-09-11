#load file in order to get datas
source("data.R")

#init PNG file
data <- getData()

#init PNG file
png(file = "plot2.png", width = 480, height = 480)

#create full plot2
plot( data$DateFormat, data$Global_active_power , type = "l", xlab="",ylab="Global Active Power (kilowwatts)")

#close PNG file
dev.off()