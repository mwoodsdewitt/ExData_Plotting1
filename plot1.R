library(readr)
household_power_consumption <- read_delim("C:/Users/Owner/Desktop/exploratory_data_analysis_course4_assignment1/household_power_consumption.txt",";", escape_double = FALSE, trim_ws = TRUE)
#trimming the data to dates between 01/02/2007 - 02/02/2007
household_power_consumption <- rbind(household_power_consumption[household_power_consumption$Date=="1/2/2007",],household_power_consumption[household_power_consumption$Date=="2/2/2007",])
#converting Date from a character variable to a date variable in the correct format
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
#creating the Date/Time variable
household_power_consumption <- cbind(household_power_consumption,"Date_Time" = as.POSIXct(paste(household_power_consumption$Date,household_power_consumption$Time)))
#creating the chart for plot 1
hist(as.numeric(household_power_consumption$Global_active_power), col="Red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")