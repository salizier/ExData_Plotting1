#load file in order to get datas
source("data.R")

#init PNG file
data <- getData()

#init PNG file
png(file = "plot3.png", width = 480, height = 480)

#init plot with black line (Sub_metering_1)
plot( data$DateFormat, data$Sub_metering_1 , type = "l", ylab="Energy sub metring",xlab="")
#add red lines to plot line (Sub_metering_2)
lines( data$DateFormat, data$Sub_metering_2 , type = "l", col="red")
#add blue lines to plot line (Sub_metering_3)
lines( data$DateFormat, data$Sub_metering_3 , type = "l", col="blue")
#add legend
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # text of the legend 
       lty=c(1,1), # legend symbols (lines)
       lwd=c(2.5,2.5),col=c("black","blue","red"), # legend color lines
       bty = "n") #no border for legend) 

#close PNG file
dev.off()