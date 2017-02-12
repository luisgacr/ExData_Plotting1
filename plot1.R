library(dplyr)
library(grDevices)

setwd("D:/ApplicationFiles/Aprendizaje/DataScience/DataScience/Module4/Data/Module4Project1")
inputData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

id1<-filter(inputData,Date == "1/2/2007" | Date == "2/2/2007" )#<------------------------------------ filter for two dates

hist(as.numeric(as.character(id1$Global_active_power)),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png",units="px",width=480,height=480)#<--------------------------------- copy plot to a file
dev.off()
dev.off()
