library(TTR)

# Trend Detection Index USD
tdi_usd <- data.frame(TDI(dataset$USD, n = 20, multiple = 2))

# Rate of Change USD
roc_usd <- ROC(dataset$USD, n = 1, 
	type = c("continuous", "discrete"), na.pad = TRUE)

# Creates a long TDI set with each currency end-end-to-end
tdi <- data.frame(TDI(dataset, n = 20, multiple = 2))



