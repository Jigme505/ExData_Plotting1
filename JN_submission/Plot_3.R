# Coursera Course: Exploratory Data Analysis
## Course Project 1: Plot 3
## Author: Jigme Norbu


## setting working directory and reading data

setwd("C:/Users/Jigme505/Desktop/DATA SCIENCE COURSEs/4 - Exploratory Data Analysis/Course_project_1_plotting")

electric_data <- read.table("household_power_consumption.txt", sep =";", na.strings="?", header=TRUE)

str(electric_data)                                                            ## gives a summary of the variables and their classes



##--------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------##



## combing the Time and Date Variable by using Paste() function and then converting it into POSIXlt date/time format
date_time = strptime(paste(electric_data$Date, electric_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##taking the subset of the data
sub_data <- subset(electric_data, date_time>="2007-02-01 00:00:00" & date_time <= "2007-02-03 00:00:00") 

date_time_sub <- subset(date_time, date_time>="2007-02-01 00:00:00" & date_time <= "2007-02-03 00:00:00") 



## naming the variables for plotting purposes

Glob_Act_Pow <- sub_data$Global_active_power
Glob_React_pow <- sub_data$Global_reactive_power
Sub_metering_1 <- sub_data$Sub_metering_1
Sub_metering_2 <- sub_data$Sub_metering_2
Sub_metering_3 <- sub_data$Sub_metering_3



##--------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------##



## Plot 3

par(mar=c(4,4,1,1), mfcol=c(1,1))

plot.new()
plot(date_time_sub,Sub_metering_1, type="s",xlab="", ylab="Energy sub metering")
lines(date_time_sub, Sub_metering_2, type="s", col="red")
lines(date_time_sub, Sub_metering_3, type ="s", col="blue")
legend("topright", pch="_____", col=c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7)
dev.copy(png, file="Plot_3.png")
dev.off()
