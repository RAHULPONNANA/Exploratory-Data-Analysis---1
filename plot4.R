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

#store the character values that are required to plot in variables of numeric type
data<-as.numeric(df1$Global_active_power)

voltage<-as.numeric(df1$Voltage)

react<-as.numeric(df1$Global_reactive_power)

d1<-as.numeric(df1$Sub_metering_1)
d2<-as.numeric(df1$Sub_metering_2)
d3<-as.numeric(df1$Sub_metering_3)

#save the plots into a png file
png("plot4.png",width = 480,height = 480)

#divide the image into 4 plots by par() function
par(mfrow=c(2,2))

#plots

#plot1
plot(dt,data,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(dt,voltage,type="l",xlab="datetime",ylab = "Voltage")

#plot3
plot(dt,d1,type="l",ylab="Energy Submetering",xlab="")
lines(dt,d2,type="l",col="red")
lines(dt,d3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty=1,col=c("black","red","blue"))

#plot4
plot(dt,react,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
#save the image 