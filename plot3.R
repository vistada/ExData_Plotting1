## Read the text file

hpc <- read.table("household_power_consumption.txt", na.strings = "?",
                  sep=";", header=TRUE)

## Convert Date column to Date type

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Select rows for the two days

dpc <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]

## Convert time to POSIX form

dpc <- transform(dpc, times=as.POSIXct(paste(Date, Time)))

## Set the margin and plot
par(mar = c(2.2,4,0,0))
plot(dpc$times,dpc$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(dpc$times,dpc$Sub_metering_2,col="red")
lines(dpc$times,dpc$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,2), lwd=c(1,2), cex = .33, adj = c(0,1), xjust = 1, y.intersp = 1)

## Copy the graph to a png file

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()