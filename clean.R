library(jsonlite)
library(dplyr)
library(stringr)

# declare some handy vaiables
setwd("~/Desktop/di/data")
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


for (i in 1:length(jsonDump)) {

# Convert to str, delete headings
	rawvector[i] <- toString(jsonDump[i]) %>% substring(92)

# Replace NULL values with the last real values
	if (jsonDump[i] == "") {
        jsonDump[i] <- jsonDump[i-1]
	}
	
}


