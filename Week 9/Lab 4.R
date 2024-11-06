######################################################################################
# Filename:      Lab 4.R
# Description:   R Script for SC212 Lab 4
# Author:        Francis O'Hara
# Date Modified: 10/29/24
######################################################################################
# test pnorm
pnorm(0)

######################################################################################
# Q1 (2 points):  What is the proportion of healthy men with cholesterol levels above this?
# Use Statkey to find the answer.
# Note:  you could also use the standard normal table on our Moodle site.
######################################################################################
mean <- 219
sd <- 41
z <- (260 - mean) / sd
answer <- 1 - pnorm(z)

######################################################################################
# Q2 (3 points):  What is the proportion of men with serum cholesterol levels between 200 mg/100 ml and 230 mg/100ml?
# Hint: it helps to draw a picture and shade in the area you’re looking for.
# Make sure you can use RStudio, Statkey, and the Z-table on our moodle page to find this value.
######################################################################################
z1 <- (230 - mean) / sd
z2 <- (200 - mean) / sd
answer <- pnorm(z1) - pnorm(z2)

######################################################################################
# Q3 (2 points):  What value of serum cholesterol marks the 10th percentile for healthy men
# (i.e., what is the value of x where P(X < x) = 0.1?
# Again, try doing this using RStudio Statkey, and the Z-table on our moodle page.
# The command qnorm(p) returns a Z-score such that the area to the left of the Z-score is equal to p.
# For example, if you type qnorm(.5), RStudio should return the value 0.
# In this way, the commands pnorm() and qnorm() complement each other.
# Use them to find areas under a standard normal curve (pnorm) and to find Z-scores (qnorm).
######################################################################################
answer <- mean + (sd * qnorm(0.1))

######################################################################################
# Q4 (1 point):  Generate a table to see the proportion of current smokers using the table() command.
# Calculate the proportion of participants that are current smokers.
######################################################################################
library(Lock5Data)
data(NutritionStudy)

data <- table(NutritionStudy$Smoke)
n <- as.numeric(data[1] + data[2])
smokers <- as.numeric(data[2])
non.smokers <- as.numeric(data[1])

proportion <- smokers / n
proportion
data

######################################################################################
# Q5 (1 point):  Find a 95% CI for the population proportion of smokers using the data from NutritionStudy.
######################################################################################
# using R-Studio
prop.test(smokers, n)

# using formulas
se <- sqrt((proportion * (1 - proportion))/n)
se
z.star <- qnorm(0.975)
confidence.interval <- c(proportion - (se * z.star), proportion + (se * z.star))
confidence.interval

# using Statkey
c((43/315) - (1.960 * 0.020), (43/315) + (1.960 * 0.020))

c
# Q7 (1 point):  Is 0.25 a plausible value?  Look for the p-value in the output and report.
######################################################################################
prop.test(smokers, n, p=0.25, alternative="less")

######################################################################################
# Q8 (2 points): Using the sample proportion from the observed data, calculate the z-score assuming the null hypothesis
# is true and report the area to the left under the standard normal distribution (this is the p-value).
######################################################################################
proportion.null <- 0.25
se <- sqrt((proportion.null * (1 - proportion.null))/n)
z.score <- (proportion - proportion.null)/se
z.score
pnorm(z.score)

######################################################################################
# Q11 (3 points):  If you were to repeatedly draw samples of size 25 from this population,
# what do you think the distribution of sample means would look like?
# Describe the shape you would expect it to be, and what its mean would be,
# and what its SE would be.
######################################################################################
my.data <- c(3, 3, 3, 4, 4,
5, 5, 5, 5, 6,
7, 7, 8, 8, 9,
9, 9, 10, 11, 11,
11, 11, 14, 17, 30)

hist(my.data)
mean(my.data)
sd(my.data)

5.715476 / sqrt(25)

######################################################################################
# Q12 (5 points):  Assume that the population is normal.
# Using this data, perform a one-sample t-test by hand to test the null hypothesis that
# the mean hospital stay is 5 days (use a two-sided alternative).
# 1) define your parameter of interest
# 2) state null and alternative hypotheses
# 2.1) check assumptions  2.2) calculate a test statistic  3) determine the p-value 4) make a decision  5) state your conclusion.
######################################################################################
n <- length(my.data)
x_ <- mean(my.data)
s <- sd(my.data)
null.mean <- 5
t.value <- (x_ - null.mean)/(s/sqrt(n))
t.value
p.value <- 1 - pt(t.value, 24)
p.value

######################################################################################
# Q13 (2 points):  Now perform this test in RStudio, using the t.test() command.
######################################################################################
t.test(my.data, mu=5, alternative="two.sided")
