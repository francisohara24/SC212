########################################################################################################################
# Filename:      Chapter 9.R
# Description:   R Scripts for SC212 Chapter 9 Reading
# Author:        Francis O'Hara
# Date Modified: 11/17/24
########################################################################################################################
library(Lock5Data)
data(InkjetPrinters)

my.lm <- lm(InkjetPrinters$Price ~ InkjetPrinters$PPM)
summary(my.lm)