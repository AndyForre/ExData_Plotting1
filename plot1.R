dataset = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE, dec=".")

##Subset data

UseData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]


##Convert to numeric

globalActivePower <- as.numeric(UseData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower,col="red",main="Global Active Power",breaks=11,xlab="Global Active Power (kilowatts)")

dev.off()


