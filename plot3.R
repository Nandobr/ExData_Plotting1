## PLOT 3

## Set working directory
setwd("~/R_Coursera/PowerConsumptionData")
## Read table "household_power_consumption.txt"
Powerdata <- read.table("household_power_consumption.txt", sep=";",header = TRUE, na.strings = "?",
                        colClasses=c("character", "character", rep("numeric",7)))
## convert the Date and Time variables to Date/Time classes
Powerdata$Time <- strptime(paste(Powerdata$Date, Powerdata$Time), "%d/%m/%Y %H:%M:%S")
Powerdata$Date <- as.Date(Powerdata$Date, "%d/%m/%Y")
## set time period to subset dataset
timePeriod <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
Powerdata <- subset(Powerdata, Date %in% timePeriod)
## set system locale to make sure weekday is printed in English
Sys.setlocale("LC_TIME", "English")
## Define graphic device parameters
png("plot3.png", width=480, height=480)
## Plot line graph of Global Active Power x dat-time
plot(Powerdata[,2],Powerdata[,7], type="n", ylab="Energy sub metering", xlab="")
lines(Powerdata[,2],Powerdata[,7],type="l")
lines(Powerdata[,2],Powerdata[,8],type="l", col="red")
lines(Powerdata[,2],Powerdata[,9],type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
## close the PNG device
dev.off()

