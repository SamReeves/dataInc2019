library(tidyr)
library(purrr)
library(dplyr)

setwd("~/Desktop/di")
dump <- read.csv(file="collisions.csv", header=TRUE, sep=",")

as.Date(dump$DATE, format = "%m/%d/%Y")
