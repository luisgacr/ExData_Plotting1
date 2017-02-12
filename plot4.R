library(dplyr)
library(grDevices)

setwd("D:/ApplicationFiles/Aprendizaje/DataScience/DataScience/Module4/Data/Module4Project1")
inputData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")


par(mfrow=c(2,2))
id1<-filter(inputData,Date == "1/2/2007" | Date == "2/2/2007" )#<------------------------------------ filter
par(mar=c(6,5,2,2))
id2<-mutate(id1, DateTime=paste(Date, Time)) #<------------------------------------ mutate

x<-as.numeric(as.character(id2[,"Global_active_power"]))
y<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")
plot(y,x,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(y, x, type="l") 

x<-as.numeric(as.character(id2[,"Voltage"]))
y<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")
plot(y,x,type="n",ylab="Voltage",xlab="")
lines(y, x, type="l") 

w<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")
x<-as.numeric(as.character(id2[,"Sub_metering_1"]))
y<-as.numeric(as.character(id2[,"Sub_metering_2"]))
z<-as.numeric(as.character(id2[,"Sub_metering_3"]))
plot(w,x,type="n",ylab="Energy sub metering",xlab="")
lines(w, x, type="l", col="black") 
lines(w, y, type="l", col="red") 
lines(w, z, type="l", col="blue") 
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

x<-as.numeric(as.character(id2[,"Global_reactive_power"]))
y<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")
plot(y,x,type="n",ylab="Global_reactive_power",xlab="")
lines(y, x, type="l") 

dev.copy(png, file="plot4.png",units="px",width=480,height=480)#<--------------------------------- copy plot to a file
dev.off()
dev.off()
