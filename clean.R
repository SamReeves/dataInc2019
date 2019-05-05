library(jsonlite)
library(dplyr)
library(stringr)


# declare some handy vaiables
setwd("~/Desktop/di/data")
fileList <- list.files(pattern = "*.json")
jsonDump <- lapply(fileList, fromJSON)
dates <- c()
dataset = c()
currencies <- factor(c("USD","VND","THB","SEK","LKR","ZAR","RSD","SAR","RUB",
		"PHP","PKR","NOK","NZD","NPR","MYR","LAK","KWD","KRW","KES",
		"ILS","IDR","INR","HKD","EGP","DKK","CZK","CNY","CAD",
		"KHR","BND","BRL","BDT","AUD","JPY","CHF","GBP","SGD",
		"EUR"))


# make an index of dates, convert to Date
for (i in 1:length(fileList)) {
  dates[i] <- substr(fileList[i], 1, 10)
}
dates <- as.Date(dates, '%Y.%m.%d')


# Convert to dataframes...
# Remove useless headings, remove commas
for (i in 1:length(jsonDump)) {
	sliver <- unlist(jsonDump[i], use.names=FALSE) %>%
		tbl_df %>% slice(4:41)
	sliver <- sapply(sliver, function(v) {
		as.numeric(gsub("\\,","", as.character(v)))
	})


# Replace NULL values with previous values
	if (length(sliver) != length(currencies)) {
        sliver <- dataset[i-1]
	}

dataset <- c(dataset, tbl_df(sliver))
}
