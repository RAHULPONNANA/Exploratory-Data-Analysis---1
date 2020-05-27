setwd("C:/Users/Sai Rahul/Desktop/Coursera")
#set the location of working directory

library(lubridate)
#import required libraries

df<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#read the data into a data frame

df<-subset(df,df$Date>=dmy("01/02/2007") & df$Date<=dmy("02/02/2007"))
#subset the values that are only required

png("rplot1.png")
#save the plot into png format

hist(as.numeric(df$Global_active_power),  main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
#plot a histogram for global active power with color as red

dev.off()
#save the file