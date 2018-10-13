## Installing ggplot2 package, which contains lots of
## nice stuff for graphical analysis,
## including everything we need for base plotting

install.packages("ggplot2")

library(ggplot2)

## import the txt data using ; as a separator and ? for missing values

electricity <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")

## converting the Date column into date format


electricity$Date <- as.Date(electricity$Date, format="%d/%m/%Y")

## a quick view of the structure of the database 

str(electricity)

## and  a quick view of the first few rows

head(electricity)


## now within our 2 days framework we drop the Global_Intensityvariable
## as it's the only one we don't need in this case

## a quick view of this new dataframe

electricity_two_days_eight <- subset(electricity, Date >= "2007-02-01" 
& Date <= "2007-02-02", select= -Global_intensity)


head(electricity_two_days_eight) 

str(electricity_two_days_eight)

# this is a numeric vector created pasting the Date and Time variable 
## of the electricity_two_days_eight dataframe

ourtimes <- paste (as.Date(electricity_two_days_eight$Date),
electricity_two_days_eight$Time)

## convert this numeric vector into a date format with the as.POSIXct function

ourtimes <- as.POSIXct(ourtimes)

## again we create some vectors out of our 2 days dataframe columns to simplify
## our writing process

gpower <- electricity_two_days_eight$Global_active_power

rpower <- electricity_two_days_eight$Global_reactive_power

Voltage <- electricity_two_days_eight$Voltage

sub1 <- electricity_two_days_eight$Sub_metering_1

sub2 <- electricity_two_days_eight$Sub_metering_2

sub3 <- electricity_two_days_eight$Sub_metering_3

## now we have to create 4 plots on the same panel:
## we use the par function with 2 rows and 2 columns

par(mfrow=c(2,2))

plot(gpower ~ ourtimes,  type="l", xlab="",
 ylab="Global Active Power")

plot(Voltage ~ ourtimes,  type="l", xlab="datetime",
 ylab="Global Active Power (kilowatts)")

plot(sub1 ~ ourtimes,  type="l", xlab="",
 ylab="Energy sub metering)", col="black")

lines (sub2 ~ ourtimes, col="red")

lines (sub3 ~ ourtimes, col ="blue")

## notice that in this case we eliminated the border to our legend box
## and we reduced the font size of the legend comparing to the default settings

legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n", cex=0.6)

plot(rpower ~ ourtimes,  type="l", xlab="datetime",
 ylab="Global_reactive_power")


## finally as usual we copy our chart to a png file of 480x480 size

dev.copy(png, file= "plot4.png", height= 480, width = 480)

dev.off()

