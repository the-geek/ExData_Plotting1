data <- read.table("household_power_consumption.txt",header=T,sep=';',na.strings="?",colClasses=c("character","character",rep("numeric",7)))
data <- subset(data,Date %in% c("1/2/2007","2/2/2007") )
png("plot1.png")
hist(data$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()