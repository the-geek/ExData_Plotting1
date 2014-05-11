# Read data
data <- read.table("household_power_consumption.txt",header=T,sep=';',na.strings="?",colClasses=c("character","character",rep("numeric",7)))
data <- subset(data,Date %in% c("1/2/2007","2/2/2007") )
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Produce plot
png("plot4.png")
par(mfrow=c(2,2))


# Plot 1
plot(data$Global_active_power,type='l',main="",xlab="",ylab="Global Active Power",xaxt = "n")
axis(1,seq(0,nrow(data),length.out=3),c("Thu","Fri","Sat"))

# Plot 2
plot(data$Voltage,type='l',main="",ylab="Voltage",xlab="datetime",xaxt = "n")
axis(1,seq(0,nrow(data),length.out=3),c("Thu","Fri","Sat"))


# Plot 3
plot(data$Sub_metering_1,type='l',main="",xlab="",ylab="Energy sub metering",xaxt = "n")
lines(data$Sub_metering_2,col='red')
lines(data$Sub_metering_3,col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),ncol=1,cex=0.95,lwd=1,bty='n')
axis(1,seq(0,nrow(data),length.out=3),c("Thu","Fri","Sat"))


# Plot 4
plot(data$Global_reactive_power,type='l',main="",ylab="Global_reactive_power",xlab="datetime",xaxt = "n")
axis(1,seq(0,nrow(data),length.out=3),c("Thu","Fri","Sat"))

dev.off()
