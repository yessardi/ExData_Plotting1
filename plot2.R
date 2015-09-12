## Read the file
epc = read.table("household_power_consumption.txt",sep = ";", 
                 header = TRUE, stringsAsFactors = FALSE)

## Format the variables
epc$Date = as.Date(epc$Date, "%d/%m/%Y")
epc$DateTime = as.POSIXct(paste(epc$Date, epc$Time ),format="%Y-%m-%d %H:%M:%S")
epc$Global_active_power = as.numeric(epc$Global_active_power,na.rm = TRUE)

## Subset the dataset for required dates
validdates = as.Date(c("2007-02-01","2007-02-02"))
epc = epc[epc$Date %in% validdates,]

## Make plot on screen device
with(epc, plot(DateTime,Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")) 

## Copy the plot to png device
dev.copy(png, file = "plot2.png")
dev.off()