library(dplyr)
library(grDevices)

setwd("D:/ApplicationFiles/Aprendizaje/DataScience/DataScience/Module4/Data/Module4Project1")
inputData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

id1<-filter(inputData,Date == "1/2/2007" | Date == "2/2/2007" )#<------------------------------------ filter for two dates

par(mar=c(6,5,2,2))

id2<-mutate(id1, DateTime=paste(Date, Time)) #<------------------------------------ paste date and time for strptime

w<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")

x<-as.numeric(as.character(id2[,"Sub_metering_1"]))
y<-as.numeric(as.character(id2[,"Sub_metering_2"]))
z<-as.numeric(as.character(id2[,"Sub_metering_3"]))

plot(w,x,type="n",ylab="Energy sub metering",xlab="")

lines(w, x, type="l", col="black") 
lines(w, y, type="l", col="red") 
lines(w, z, type="l", col="blue") 

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png",units="px",width=480,height=480)#<--------------------------------- copy plot to a file
dev.off()
dev.off()

