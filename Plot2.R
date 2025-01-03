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
#plot 2 and png
png("/Users/sba6003/Downloads/Plot2.png", width = 480, height = 480)
plot(data$Datetime,data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
```
