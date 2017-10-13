#This script generates plot4.png
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

#Using the png device it will generate a combination of 4 line charts (Global active power, Three sub_metering measurements, Voltage and Global reactive power)

png('plot4.png',width=480,height=480)

par(mfrow=c(2,2))

plot(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_active_power)), main ="", ylab="Global Active Power",xlab="",type="n")
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_active_power)))

plot(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Voltage)), main ="", ylab="Voltage",xlab="datetime",type="n")
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Voltage)))

plot(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Sub_metering_1)), main ="", ylab="Energy sub metering",xlab="",type="n")
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Sub_metering_1)),col=c("black"))
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Sub_metering_2)),col=c("red"))
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Sub_metering_3)),col=c("blue"))
legend("topright", inset=0.00,,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col= c("black","red","blue") )

plot(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_reactive_power)), main ="", ylab="Global_reactive_power",xlab="datetime",type="n")
lines(twodaydataframe$twodaydatetime, as.double(as.character(twodaydataframe$Global_reactive_power)))

dev.off()


