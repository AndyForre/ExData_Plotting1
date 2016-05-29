##load data

dataset = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE,dec=".")

##Subset data based on dates

UseData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert Global active to numeric values

Global_active_power <- as.numeric(UseData$Global_active_power)

##create a column which combine date and time

UseData$DateTime <-paste(UseData$Date, UseData$Time)

##convert to right format of time and days

Days <- strptime(UseData$DateTime,"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

with(UseData, plot(Days,Global_active_power,type="l",xlab=" ",ylab ="Global Active Power (kilowatts)" ))

dev.off()


