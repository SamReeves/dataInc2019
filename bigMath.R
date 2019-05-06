library(gmp)

series <- function (n,k) {
	k <- as.bigz(k)
	n <- as.bigz(n)
	mod <- add.bigz(pow.bigz(10, 10), 7)
	ans <- mul.bigz(pow.bigz(k-1, n-3), k-2)
	return(mod.bigz(ans, mod))
}

series(4,4)
series(4,100)
series(100,100)
series(347,2281)
series(1.26*10^6, 4.17*10^6)
series(10^7, 10^12)
