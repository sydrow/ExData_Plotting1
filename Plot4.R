title: "R Notebook"
output: html_notebook
---
```{r}
#dataset
power <- read.csv("/Users/sba6003/Downloads/household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", check.names = F, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
```


```{r}
#subset of dates used
data <-subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")
```

```{r}
#datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
```

```{r}
library(grDevices)
```

```{r}
#plot 4 and png
png("/Users/sba6003/Downloads/Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})
```
