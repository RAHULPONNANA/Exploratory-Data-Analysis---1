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

#store the global active power in a variable of numeric type
data<-as.numeric(df1$Global_active_power)

png("plot2.png", width = 480, height = 480)
#save the plot into png format

plot(dt,data,type="l", xlab="", ylab="Global Active Power (kilowatts)")
#plot the graph for global active power to the time of two days

dev.off()
#save the image