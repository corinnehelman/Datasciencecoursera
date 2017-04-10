
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

# create a png plot with required dimensions
dev.copy(png, file="plot1.png", width=480, height=480)

# plot in red with labels and title, globalActivePower
hist(data[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()




