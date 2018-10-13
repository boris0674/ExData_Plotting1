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

## now create a subset with the 3 variables we need

electricity_two_days_three <- subset(electricity, Date >= "2007-02-01" 
& Date <= "2007-02-02", 
select= c(Date, Time, Global_active_power))

## a quick view of this new database

head(electricity_two_days_three) 

str(electricity_two_days_three)

## create 2 vectors from our dataframe to simplify our writing



ourpower <- electricity_two_days_three$Global_active_power

## speficically this is a numeric vector created pasting the Date and Time variable 
## of the electricity_two_days_three dataframe

ourtimes <- paste (as.Date(electricity_two_days_three$Date),
electricity_two_days_three$Time)

## convert this numeric vector into a date format with the as.POSIXct function

ourtimes <- as.POSIXct(ourtimes)


## plotting a line of the 2 variables we need, notice gio, ven and sab are
## the equivalent in Italian of Thu, Fri and Sat



plot(ourpower ~ ourtimes,  type="l", xlab="",
 ylab="Global Active Power (kilowatts)")





## we copy our chart to a png file of 480x480 size

dev.copy(png, file= "plot2.png", height= 480, width = 480)

dev.off()


