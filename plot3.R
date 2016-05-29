##load data

dataset = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE,dec=".")

##Subset data based on dates

UseData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert to numeric values

Global_active_power <- as.numeric(UseData$Global_active_power)

Global_reactive_power <- as.numeric(UseData$Global_reactive_power)

Sub_metering_1 <- as.numeric(UseData$Sub_metering_1)
Sub_metering_2 <- as.numeric(UseData$Sub_metering_2)
Sub_metering_3 <- as.numeric(UseData$Sub_metering_3)

##create a column which combine date and time

UseData$DateTime <-paste(UseData$Date, UseData$Time)

##convert to right form

Days <- strptime(UseData$DateTime,"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(Days,Sub_metering_1,type="l",xlab=" ",ylab ="Energy submetering")
lines(Days,Sub_metering_2,type="l",col="red")
lines(Days,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

dev.off()