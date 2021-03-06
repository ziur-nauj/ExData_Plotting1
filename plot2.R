#This script generates plot2.png
#It assumes the datafile "household_power_consumption.txt" is in the working directory

#Reading data
mydata <-read.table("household_power_consumption.txt",sep=";",header=TRUE)
x <- paste(mydata$Date,mydata$Time)
datetime<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Getting the first two days in february, 2007 
twodaydatetime <- datetime[66637:69516]
twodaydata<-mydata[66637:69516,]

#Generating data frame with date and time merged in the first column
twodaydataframe <- data.frame(twodaydatetime,twodaydata[,3:length(twodaydata)])


#Using the png device it will generate the line chart of active power
png('plot2.png',width=480,height=480)
plot(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_active_power)), main ="", ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_active_power)))
dev.off()
