dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

with(dat, hist(Global_active_power, col="RED",main = "Global Active Power", xlab ="Global Active Power (kilowatts)" ) )
## Make plot appear on screen device


dev.copy(png, file ="plot1.png") 
dev.off()