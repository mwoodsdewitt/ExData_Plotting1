library(readr)
household_power_consumption <- read_delim("C:/Users/Owner/Desktop/exploratory_data_analysis_course4_assignment1/household_power_consumption.txt",";", escape_double = FALSE, trim_ws = TRUE)
#trimming the data to dates between 01/02/2007 - 02/02/2007
household_power_consumption <- rbind(household_power_consumption[household_power_consumption$Date=="1/2/2007",],household_power_consumption[household_power_consumption$Date=="2/2/2007",])
#converting Date from a character variable to a date variable in the correct format
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
#creating the Date/Time variable
household_power_consumption <- cbind(household_power_consumption,"Date_Time" = as.POSIXct(paste(household_power_consumption$Date,household_power_consumption$Time)))
#creating the chart for plot 4
par(mfrow=c(2,2))
plot(household_power_consumption$Global_active_power ~ household_power_consumption$Date_Time, type="l", ylab = "Global Active Power", xlab="")
plot(household_power_consumption$Voltage ~ household_power_consumption$Date_Time, type="l", ylab = "Voltage", xlab="datetime")
with(household_power_consumption, {plot(Sub_metering_1 ~ Date_Time, type="l", xlab= "", ylab="Energy sub metering")})
lines(household_power_consumption$Sub_metering_2 ~ household_power_consumption$Date_Time, col = 'Red')
lines(household_power_consumption$Sub_metering_3 ~ household_power_consumption$Date_Time, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
plot(household_power_consumption$Global_reactive_power ~ household_power_consumption$Date_Time, type="l", xlab="datetime", ylab="Global_reactive_power")