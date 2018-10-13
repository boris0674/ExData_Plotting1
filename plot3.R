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

## now create a subset with the 5 variables we need over a 2 days timeframe


electricity_two_days_five <- subset(electricity, Date >= "2007-02-01" 
& Date <= "2007-02-02", 
select= c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))

## a quick view of this new dataframe

head(electricity_two_days_five) 

str(electricity_two_days_five)

# this is a numeric vector created pasting the Date and Time variable 
## of the electricity_two_days_five dataframe

ourtimes <- paste (as.Date(electricity_two_days_five$Date),
electricity_two_days_five$Time)

## convert this numeric vector into a date format with the as.POSIXct function

ourtimes <- as.POSIXct(ourtimes)

## again we create some vectors out of our 2 days dataframe columns to simplify
## our writing process

sub1 <- electricity_two_days_five$Sub_metering_1

sub2 <- electricity_two_days_five$Sub_metering_2

sub3 <- electricity_two_days_five$Sub_metering_3



## plotting a line of the 2 variables we need, notice gio, ven and sab are
## the equivalent in Italian of Thu, Fri and Sat

## we create again a line plot, within our base plotting framework
## we can subsequently add new line plots on the same panel with the lines functions
## finally we wrap up our notes with the required legend
## again gio, ven, sat is Italian for Thu, Fri, Sat

plot(sub1 ~ ourtimes,  type="l", xlab="",
 ylab="Energy sub metering)", col="black")

lines (sub2 ~ ourtimes, col="red")

lines (sub3 ~ ourtimes, col ="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

## again we copy our chart to a png file of 480x480 size

dev.copy(png, file= "plot3.png", height= 480, width = 480)

dev.off()


