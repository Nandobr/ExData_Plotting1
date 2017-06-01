## PLOT 1

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
## Define graphic device parameters
png("plot1.png", width=480, height=480)
## Plot histogram of Global Active Power
hist(Powerdata[,3], col="red", xlab = "Global Actvive Power (Kilowatts)", main = "Global Active Power")

## close the PNG device
dev.off()

