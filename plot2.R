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

par(mar = c(5, 4, 3, 1))
plot(dpc$times, dpc$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

## Copy the graph to a png file

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()