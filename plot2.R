#plot2
library(dplyr)
library(lubridate)
input <- "./exdata-data-household_power_consumption.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(input)) {
        
        download.file(fileurl,destfile =input,method ="wget")
        
}
unzip(input,exdir = "./")
#read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings ="?")

rawdata <- read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings ="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
rawdata <- select(rawdata,Date,Time,Global_active_power)
#select the date range 2007-02-01 to 2007-02-02
rawdata <- filter(rawdata,Date == "1/2/2007" | Date == "2/2/2007" )

rawdata$DateTime <- paste(rawdata$Date,rawdata$Time,sep=" ")
#rawdata$DateTime <- sapply(rawdata$DateTime,function(x){ x <-strptime(x,format= "%d/%m/%Y %H:%M:%S")})
rawdata$DateTime <- strptime(rawdata$DateTime,format= "%d/%m/%Y %H:%M:%S")

#plot graph and copy to ExData_Plotting1 folder
plot(rawdata$DateTime, rawdata$Global_active_power,
                  type="l",
                  xlab="",
                  ylab="Global Active Power (kilowatts)") 
dev.copy(png,file="./ExData_Plotting1/plot2.png",width=480,height=480)
dev.off()
#
