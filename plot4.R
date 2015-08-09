#plot4
library(dplyr)
input <- "./exdata-data-household_power_consumption.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(input)) {
        
        download.file(fileurl,destfile =input,method ="wget")
        
}
unzip(input,exdir = "./")
rawdata <- read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings ="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#select the date range 2007-02-01 to 2007-02-02
rawdata <- filter(rawdata,Date == "1/2/2007" | Date == "2/2/2007" )

rawdata$DateTime <- paste(rawdata$Date,rawdata$Time,sep=" ")

rawdata$DateTime <- strptime(rawdata$DateTime,format= "%d/%m/%Y %H:%M:%S")

#plot graph and copy to ExData_Plotting1 folder
par(mfrow=c(2,2),mar=c(4,4,2,2))

plot(rawdata$DateTime, rawdata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power") 

plot(rawdata$DateTime, rawdata$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage") 

 plot(rawdata$DateTime, rawdata$Sub_metering_2,
             type="l",
             xlab="",
             col="red",
             ylab="",
             ylim=c(0,40)
        )
        par(new=TRUE)
        plot(rawdata$DateTime, rawdata$Sub_metering_3,
             type="l",
             xlab="",
             col="blue",
             ylab="",
             ylim=c(0,40)
        ) 
        par(new=TRUE)
        plot(rawdata$DateTime, rawdata$Sub_metering_1,
             type="l",
             xlab="",
             ylab="Energy sub metering",
             ylim=c(0,40)
        ) 
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=19,col=c("black","red","blue"))


plot(rawdata$DateTime, rawdata$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_Reactive_power") 



dev.copy(png,file="./ExData_Plotting1/plot4.png",width=480,height=480)
dev.off()
#
