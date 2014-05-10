# This is my code to generate plot3.R

#Step 1: Set the working directory
setwd("/Users/satyendrakumar/")

#Step 2: Read the file using read.csv() function.
# include na.string = "?" result converting ? to NA

dataset <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" , dec = ".")

# Step 3: Combine & convert the Data & Time columns in POXIXLt format & include as column 
combine_DateTime <- paste(dataset$Date, dataset$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
dataset$DateTime <- Formated_DateTime

# Step 4: Remove NA
complete_dataset <- na.omit(dataset)

# Step 5: Select the based on given date
required_data <- complete_dataset[as.Date(complete_dataset$DateTime) =="2007-02-01"|as.Date(complete_dataset$DateTime)=="2007-02-02",]

# Step 6: Plot the graph
plot(required_data$DateTime, required_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(required_data$DateTime, required_data$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(required_data$DateTime, required_data$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Step 6: Save the output as png fiile giving required dimentions 
# Close the devise
dev.print(png, file='plot3.png', width = 480, height=480)
dev.off()
