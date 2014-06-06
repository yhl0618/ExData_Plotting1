household<-read.csv(file = "household_power_consumption.txt", 
                    header = TRUE, 
                    sep=";", 
                    na.strings = "?",
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)
household$Date<-as.Date(household$Date,format = "%d/%m/%Y")
household$Time<-strptime(paste(household$Date,household$Time), format = "%Y-%m-%d %H:%M:%S")
household<-household[household$Date=="2007-02-01" | household$Date=="2007-02-02",]

with(household,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(household,lines(Time,Sub_metering_2,col="red"))
with(household,lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off
