Sys.setlocale("LC_ALL","English")
dataDirectory = "data"
zipFile = paste(dataDirectory,"exdata-data-household_power_consumption.zip",sep="/")
zipUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile = paste(dataDirectory,"household_power_consumption.txt",sep="/")
finalData = paste(dataDirectory,"subsetData.csv",sep="/")

getData <- function(limit = NULL){
    dir.create(dataDirectory, showWarnings = FALSE)  
  
  if(file.exists(finalData)){
    returnData <- read.csv(file = finalData,sep = ";")
    concatDate <- paste(returnData$Date, returnData$Time, sep = " ")
    returnData$DateFormat <- strptime(concatDate, format="%d/%m/%Y %T")
    return(returnData)
  }
  if(checkIncomeFiles()){
    data <- read.csv(file = destFile,sep = ";")
    subsetData <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
    write.table(subsetData, file = finalData, sep = ";")
    returnData <- read.csv(file = finalData,sep = ";")
    concatDate <- paste(returnData$Date, returnData$Time, sep = " ")
    returnData$DateFormat <- strptime(concatDate, format="%d/%m/%Y %T")
    return(returnData)
  }else{
    stop("No data found")
  }
}

#======================================================================
# file management
#======================================================================


checkIncomeFiles <- function(){
  if(file.exists(destFile)){
    return(TRUE)
  }else{
    message(destFile)
    return(unzipIfnecessary())
  }
}

unzipIfnecessary <- function(){
  fileName = zipFile
  if(file.exists(zipFile)){
    unzip(fileName,exdir = dataDirectory)
    return(TRUE)
  }else{
    download.file(zipUrl, zipFile)
    return(unzipIfnecessary())
  }
}