########################################################################################################################
# Filename:      Homework 7.R
# Description:   R Scripts for SC212 Homework 7
# Author:        Francis O'Hara
# Date Modified: 11/5/24
########################################################################################################################

########################################################################################################################
# Question 6.262
########################################################################################################################
x <- c(16-18, 12-20, 18-25, 21-21, 15-19, 11-8, 14-15, 22-20)
x.mean <- mean(x)
x.sd <- sd(x)
n <- length(x)
n
x
x.mean
x.sd

t <- (x.mean - 0)/(x.sd/sqrt(n))
t


########################################################################################################################
# Question 6.283
########################################################################################################################
first <- c(72, 95, 56, 87, 80, 98, 74, 85, 77, 62)
second <- c(78, 96, 72, 89, 80, 95, 86, 87, 82, 75)
first.mean <- mean(first)
first.sd <- sd(first)
first.n <- length(first)
second.mean <- mean(second)
second.sd <- sd(second)
second.n <- length(second)

first.mean
first.sd
first.n
second.mean
second.sd
second.n

difference <- first-second
difference.mean <- mean(difference)
difference.sd <- sd(difference)
difference.mean
difference.sd