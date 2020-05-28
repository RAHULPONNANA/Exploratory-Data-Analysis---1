setwd("C:/Users/Sai Rahul/Desktop/Coursera")
#set the location of working directory

library(lubridate)
#import requried libraries

df<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#read the data into a data frame

df1<-df[df$Date %in% c("1/2/2007","2/2/2007"),]
#subset the values that are only required

#combine all the date and time values into a single variable
dt<-dmy_hms(paste(df1$Date,df1$Time,sep=" "))

#convert the required values from character to numeric values
d1<-as.numeric(df1$Sub_metering_1)
d2<-as.numeric(df1$Sub_metering_2)
d3<-as.numeric(df1$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
#save the plot into png format

plot(dt,d1,type="l",ylab="Energy Submetering",xlab="")
lines(dt,d2,type="l",col="red")
lines(dt,d3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty=1,col=c("black","red","blue"))
#plot the graph according to the colors and add legend to it and name it

dev.off()
#save the image