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



par(old.par)

png(file="plot1.png")
with(data_plots,hist(Global_active_power,main= "Global active power", col = "red", xlab = "Global Active Power (kilowatts)"))

dev.off()