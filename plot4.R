###Check working directory
setwd("C:/Users/Nacho/Documents/MOOCs/Exploratory/")
getwd()

###Save original parameter
old.par<-par()

###read, subset data
format<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt", sep=";", header=T,na.strings ="?",colClasses=format)
data[,1]=as.character(data[,1])
i_plot<-(data[,1]=="1/2/2007"|data[,1]=="2/2/2007")
data_plots<-data[i_plot,]
str(data_plots)

###recognize dates
#date<-strptime(data[,1], format="%d/%m/%Y")

Sys.setlocale("LC_TIME", "eng")

dates <- data_plots$Date
format(dates)
times <- data_plots$Time
format(times)
x <- paste(dates, times)
format(x)
xx<-strptime(x, "%d/%m/%Y %H:%M:%S")
class(xx)
head(xx)



png(file="plot4.png")
par<-par(mfcol=c(2,2))

plot(xx,data_plots$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(xx,data_plots$Global_active_power)

plot(xx,data_plots$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(xx,data_plots$Sub_metering_1)
lines(xx,data_plots$Sub_metering_2,col="red")
lines(xx,data_plots$Sub_metering_3,col="blue")
legend("topright",bty = "n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red")) 

plot(xx,data_plots$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(xx,data_plots$Voltage)

plot(xx,data_plots$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(xx,data_plots$Global_reactive_power)

dev.off()