library(jsonlite)
library(dplyr)
library(stringr)

# declare some handy vaiables
setwd("~/Documents/TDI2019/data")
fileList <- list.files(pattern = "*.json")
jsonDump <- lapply(fileList, fromJSON)
dates <- c()
currencies <- c("USD","VND","THB","SEK","LKR","ZAR","RSD","SAR","RUB",
		"PHP","PKR","NOK","NZD","MYR","LAK","KWD","KRW","KES",
		"ILS","IDR","INR","HKD","EGP","DKK","CZK","CNY","CAD",
		"KHR","BND","BRL","BDT","AUD","JPY","CHF","GBP","SGD",
		"EUR")

for (i in 1:length(fileList)) {
# make a list of dataframes and an index of dates
  dates[i] <- substr(fileList[i], 1, 10)
}

jsonDump <- lapply(jsonDump, unlist)

# Replace NULL values with the last real values
for (i in 1:length(jsonDump)) {
	if (length(unlist(jsonDump[i])) != length(unlist(jsonDump[1]))) {
		jsonDump[i] <- jsonDump[i-1]
	}
	# Convert to str, delete headings
	jsonDump[i] <- toString(jsonDump[i]) %>% substring(92)
}


