# Filename:      Homework 5.R
# Description:   R Scripts for SC212 ...
# Author:        Francis O'Hara
# Date Modified: 10/25/24
library(Lock5Data)
data(MustangPrice)
my.lm <- lm(MustangPrice$Price ~ MustangPrice$Miles)
my.lm