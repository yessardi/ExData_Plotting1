## Read the file
epc = read.table("household_power_consumption.txt",sep = ";", 
                 header = TRUE, stringsAsFactors = FALSE)

## Format the variables
epc$Date = as.Date(epc$Date, "%d/%m/%Y")
epc$Global_active_power = as.numeric(epc$Global_active_power,na.rm = TRUE)

## Subset the dataset for required dates
validdates = as.Date(c("2007-02-01","2007-02-02"))
epc = epc[epc$Date %in% validdates,]

## Make plot on screen device
hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red", main = "Global Active Power")

## Copy the plot to png device
dev.copy(png, file = "plot1.png")
dev.off()