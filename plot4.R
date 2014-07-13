dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

par(mfrow=c(2,2))

with(dat, plot( Global_active_power, type="l", xaxt='n', xlab="" ) )
axis(1, at=c(1,nrow(dat)/2,nrow(dat)),labels=c("Thu","Fri","Sat"))

with(dat, plot( Voltage, type="l", xaxt='n', xlab="datetime" ) )
axis(1, at=c(1,nrow(dat)/2,nrow(dat)),labels=c("Thu","Fri","Sat"))


with(dat, plot( Sub_metering_1, type="l", xaxt='n', ylab="Energy sub metering", xlab="", col="Black" ) )
with(dat, lines( Sub_metering_2, type="l", xaxt='n', xlab="", col="Red" ) )
with(dat, points( Sub_metering_3, type="l", xaxt='n', xlab="", col="Blue" ) )
axis(1, at=c(1,nrow(dat)/2,nrow(dat)),labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

with(dat, plot( Global_reactive_power, type="l", xaxt='n', xlab="datetime" ) )
axis(1, at=c(1,nrow(dat)/2,nrow(dat)),labels=c("Thu","Fri","Sat"))


## Make plot appear on screen device


dev.copy(png, file ="plot4.png") 
dev.off()