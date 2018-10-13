## Installing ggplot2 package, which contains lots of
## nice stuff for graphical analysis,
## including everything we need for base plotting

install.packages("ggplot2")

library(ggplot2)

## import the txt data using ; as a separator and ? for missing values

electricity <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")

## converting the Date column into date format


electricity$Date <- as.Date(electricity$Date, format="%d/%m/%Y")

electricity$Time <- strptime(electricity$Time, format="

## a quick view of the structure of the database 

str(electricity)

## and  a quick view of the first few rows

head(electricity)

## creating a new database with just the 2 days of obs we need and
## the single variable we are going to plot

electricity_two_days <- subset(electricity, Date >= "2007-02-01" 
& Date <= "2007-02-02", 
select= Global_active_power)

## plotting our histogram: it seems to match what is required



hist(electricity_two_days$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)", col="red")


## copying our histogram as a png file of the required size

dev.copy(png, file= "plot1.png", height= 480, width = 480)

dev.off()



