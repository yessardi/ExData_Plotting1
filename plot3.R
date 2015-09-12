## Read the file
epc = read.table("household_power_consumption.txt",sep = ";", 
                 header = TRUE, stringsAsFactors = FALSE)

## Format the date and global active power variables
epc$Date = as.Date(epc$Date, "%d/%m/%Y")
epc$DateTime = as.POSIXct(paste(epc$Date, epc$Time ),format="%Y-%m-%d %H:%M:%S")
epc$Sub_metering_1 = as.numeric(epc$Sub_metering_1,na.rm = TRUE)
epc$Sub_metering_2 = as.numeric(epc$Sub_metering_2,na.rm = TRUE)
epc$Sub_metering_3 = as.numeric(epc$Sub_metering_3,na.rm = TRUE)

## Subset the dataset for required dates
validdates = as.Date(c("2007-02-01","2007-02-02"))
epc = epc[epc$Date %in% validdates,]

## Make plots on screen device
with(epc,{
    plot(DateTime,Sub_metering_1, type = "l", xlab = "", ylab = "")
    points(DateTime,Sub_metering_2, type = "l", col = "red")
    points(DateTime,Sub_metering_3, type = "l", col = "blue")
    title(ylab = "Energy sub metering")
    legend("topright",col = c("black","red","blue"), lty=c(1,1,1),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    }) 

## Copy the plot to png device
dev.copy(png, file = "plot3.png")
dev.off()