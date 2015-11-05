## Read the text file

hpc <- read.table("household_power_consumption.txt", na.strings = "?",
                  sep=";", header=TRUE)

## Convert Date column to Date type

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Select rows for the two days

dpc <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]

## Convert time to POSIX form

dpc$Time<-strptime(paste(dpc$Date, dpc$Time), "%d/%m/%Y %H:%M:%S")

## Set the margin

par(mar = c(5, 4, 3, 1))

## Draw the histogram

hist(dpc$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

## Copy the graph to a png file

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()