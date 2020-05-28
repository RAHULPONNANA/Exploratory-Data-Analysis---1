setwd("C:/Users/Sai Rahul/Desktop/Coursera")
#set the location of working directory

library(lubridate)
#import requried libraries

df<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#read the data into a data frame

df1<-df[df$Date %in% c("1/2/2007","2/2/2007"),]
#subset the values that are only required

png("rplot1.png", width = 480 , height = 480)
#save the plot into png format

hist(as.numeric(df1$Global_active_power), col = "red",  main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
#plot a histogram for global active power with color as red

dev.off()
#save the file