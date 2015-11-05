## Read the text file

hpc <- read.table("household_power_consumption.txt", na.strings = "?",
                  sep=";", header=TRUE)

## Convert Date column to Date type

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Select rows for the two days

dpc <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]

## Convert time to POSIX form

dpc <- transform(dpc, times=as.POSIXct(paste(Date, Time)))

## set the arrangement for multiple plots and margin

par(mfrow=c(2,2), mar = c(4,4,2.421,0.65))

## Plot # 1

plot(dpc$times,dpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Plot # 2

plot(dpc$times,dpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot # 3

par(mar = c(4,3.7,2.32,0))
plot(dpc$times,dpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dpc$times,dpc$Sub_metering_2,col="red")
lines(dpc$times,dpc$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,2), bty = "n", cex=.33, pt.cex = 5, xjust = 1, yjust = 1, y.intersp = .14) 

## Plot # 4

par(mar = c(4,4,2.421,0.65))
plot(dpc$times,dpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Copy the graph to a png file

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()