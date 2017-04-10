
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
data[,4] <- as.numeric(as.character(data[,4]))
data[,5] <- as.numeric(as.character(data[,5]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,9] <- as.numeric(as.character(data[,9]))


#create a datetime object so we use days()
datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")



# sets up the order of graphs
par(mfrow = c(2, 2), cex=0.75) 


# plots the four graphs in matrix order
plot(datetime, data[,3], type="l", xlab="", ylab="Global Active Power")

plot(datetime, data[,5], type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data[,7], type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data[,8], type="l", col="red")
lines(datetime, data[,9], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, data[,4], type="l", xlab="datetime", ylab="Global_reactive_power")

# create a png plot with required dimensions
dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()



