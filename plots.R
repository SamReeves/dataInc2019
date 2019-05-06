library(ggplot2)
library(zoo)

# line graph representing MMK/USD
x <- c(dates)
y <- c(dataset$USD)
plotdata <- data.frame(x,y)
ggplot(plotdata, aes(x, y)) + geom_line() + 
	xlab("") + ylab("Kyats per Dollar")


# plot TDI of every currency, end-to-end
plot(tdi$tdi, type='o', col="blue")
lines(tdi$di, type='o', pch=22, lty=2, col="red")

# Plot the exchange rates of the entire dataset
plot.zoo(dataset, plot.type = "single", 
    col = c("red", "blue", "green", "dark blue",
	"orange", "black", "brown", "purple", "dark red", 
	"dark purple", "forest green", "grey"))