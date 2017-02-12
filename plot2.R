library(dplyr)
library(grDevices)

setwd("D:/ApplicationFiles/Aprendizaje/DataScience/DataScience/Module4/Data/Module4Project1")
inputData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

id1<-filter(inputData,Date == "1/2/2007" | Date == "2/2/2007" )#<------------------------------------ filter for two dates

par(mar=c(6,5,2,2))

id2<-mutate(id1, DateTime=paste(Date, Time)) #<------------------------------------ paste date and time for strptime

x<-as.numeric(as.character(id2[,"Global_active_power"]))

y<-strptime(id2[,"DateTime"], "%d/%m/%Y %H:%M:%S")

plot(y,x,type="n",ylab="Global Active Power (kilowatts)",xlab="")

lines(y, x, type="l") 

dev.copy(png, file="plot2.png",units="px",width=480,height=480)#<--------------------------------- copy plot to a file

dev.off()
dev.off()
