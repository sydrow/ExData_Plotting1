title: "R Notebook"
output: html_notebook
---
```{r}
#dataset
power <- read.csv("/Users/sba6003/Downloads/household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", check.names = F, stringsAsFactors = FALSE)
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
#Plot 1 and png
png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
```


```{r}
#just plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
```
