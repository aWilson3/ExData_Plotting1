power <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
power <- power[power$Date=='1/2/2007' | power$Date == '2/2/2007',]

power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- strptime(power$Time, format = '%H:%M:%S')
power$Time <- strftime(power$Time, format = '%H:%M:%S')

for(i in 3:ncol(power)){
  power[,i] = as.numeric(power[,i])
}

png(file = 'plot3.png')
par(mar = c(3.1,4.1,4.1,4.1))

with(power, plot(Sub_metering_1, type = 'l', xaxt = 'n', ylab = 'Energy sub metering', col = 'black'))
axis(1, at = c(0,1500,2950), labels = c('Thu', 'Fri', 'Sat'))
lines(power$Sub_metering_2, col='red')
lines(power$Sub_metering_3, col='blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()