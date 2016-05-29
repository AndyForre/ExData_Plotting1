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
Voltage<-as.numeric(UseData$Voltage)
##create a column which combine date and time

UseData$DateTime <-paste(UseData$Date, UseData$Time)

##convert to right form

Days <- strptime(UseData$DateTime,"%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(Days,Global_active_power,type="l",xlab=" ",ylab ="Global Active Power")

plot(Days,Voltage,type="l",xlab="datetime",ylab ="Voltage")

plot(Days,Sub_metering_1,type="l",xlab=" ",ylab ="Energy sub metering")
lines(Days,Sub_metering_2,type="l",col="red")
lines(Days,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(Days,Global_reactive_power,type="l", xlab="Global_reactive_power",ylab="datetime")
dev.off()