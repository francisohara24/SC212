######################################################################################
# Filename:      Homework 3 (Part 2).R
# Description:   R Scripts for SC212 Homework 3 (Part 2)
# Author:        Francis O'Hara
# Date Modified: 10/04/24
######################################################################################

######################################################################################
# Question 3.110
######################################################################################
library(Lock5Data)
data(OttawaSenators2019)

# create stacked dot plot
stripchart(OttawaSenators2019$PenMins, method = "stack", offset = .5, at = 0,
           pch = 19, col = "steelblue",
           main = "Distribution of Penalty Minutes", xlab = "Minutes")

# find mean and standard deviation
mean(OttawaSenators2019$PenMins)
sd(OttawaSenators2019$PenMins)