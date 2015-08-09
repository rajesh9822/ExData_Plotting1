#plot1
library(dplyr)
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

#plot Histogram and copy to ExData_Plotting1 folder
hist(rawdata$Global_active_power,
     col="red",
     xlab ="Global Active Power (killowatts)",
     main ="Global Active Power"
     )
dev.copy(png,file="./ExData_Plotting1/plot1.png",width=480,height=480)
dev.off()
#rawdata$DateTime <- sapply(rawdata, function(x){ paste(rawdata$Date,rawdata$Time,sep=" ")})
