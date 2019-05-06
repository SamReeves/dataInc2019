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

# Transform the data into a data frame of 38 vectors
dataset <- do.call("rbind", dataset)
dataset <- split(dataset, rep(1:ncol(dataset), each = nrow(dataset)))
names(dataset) <- currencies
dataset <- data.frame(dataset)
USD <- ts(dataset$USD)
VND <- ts(dataset$VND)
THB <- ts(dataset$THB)
SEK <- ts(dataset$SEK)
LKR <- ts(dataset$LKR)
ZAR <- ts(dataset$ZAR)
RSD <- ts(dataset$RSD)
SAR <- ts(dataset$SAR)
RUB <- ts(dataset$RUB)
PHP <- ts(dataset$PHP)
PKR <- ts(dataset$PKR)
NOK <- ts(dataset$NOK)
NZD <- ts(dataset$NZD)
NPR <- ts(dataset$NPR)
MYR <- ts(dataset$MYR)
LAK <- ts(dataset$LAK)
KWD <- ts(dataset$KWD)
KRW <- ts(dataset$KRW)
KES <- ts(dataset$KES)
ILS <- ts(dataset$ILS)
IDR <- ts(dataset$IDR)
INR <- ts(dataset$INR)
HKD <- ts(dataset$HKD)
EGP <- ts(dataset$EGP)
DKK <- ts(dataset$DKK)
CZK <- ts(dataset$CZK)
CNY <- ts(dataset$CNY)
CAD <- ts(dataset$CAD)
KHR <- ts(dataset$KHR)
BND <- ts(dataset$BND)
BRL <- ts(dataset$BRL)
BDT <- ts(dataset$BDT)
AUD <- ts(dataset$AUD)
JPY <- ts(dataset$JPY)
CHF <- ts(dataset$CHF)
GBP <- ts(dataset$GBP)
SGD <- ts(dataset$SGD)
EUR <- ts(dataset$EUR)