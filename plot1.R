household<-read.csv(file = "household_power_consumption.txt", 
                    header = TRUE, 
                    sep=";", 
                    na.strings = "?",
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                    )
household$Date<-as.Date(household$Date,format = "%d/%m/%Y")
household$Time<-strptime(paste(household$Date,household$Time), format = "%Y-%m-%d %H:%M:%S")
household<-household[household$Date=="2007-02-01" | household$Date=="2007-02-02",]

with(household,hist(Global_active_power,col="red",main="Globl Active Power", xlab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off
