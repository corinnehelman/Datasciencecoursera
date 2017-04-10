
setwd("C:/Users/helmac1/Documents/Personal/Coursera/Exploratory Data Program 1")

# read the file given in the assignment
data=read.csv('household_power_consumption.txt',header=T, sep=';')

#merge column 1 and column 2 to create datatime variable
data$Datetime = paste(as.character(data[,1]) , data[,2])

# reformat the first colum as a data
data[,1]=as.Date(data$Date,'%d/%m/%Y')

# Only use the data collected between 1-2-2007 and 2-2-2007
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# make sure that the data is numeric and can be plotted
data[,3] <- as.numeric(as.character(data[,3]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))
data[,9] <- as.numeric(as.character(data[,9]))


#create a datetime object 
datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

dev.copy(png, file="plot3.png", width=480, height=480)

# plots the graph
plot(datetime, data[,7], type="line", xlab="", ylab="Energy Submetering")
lines(datetime, data[,8], type="line", col="red")
lines(datetime, data[,9], type="line", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()



