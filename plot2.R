dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

with(dat, plot( Global_active_power, type="l", xaxt='n', xlab="" ) )
axis(1, at=c(1,nrow(dat)/2,nrow(dat)),labels=c("Thu","Fri","Sat"))


## Make plot appear on screen device


dev.copy(png, file ="plot2.png") 
dev.off()