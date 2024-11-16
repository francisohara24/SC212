########################################################################################################################
# Filename:      Homework 8.R
# Description:   R Scripts for SC212 Homework 8
# Author:        Francis O'Hara
# Date Modified: 11/15/24
########################################################################################################################

########################################################################################################################
# Question 8.42
########################################################################################################################
library("Lock5Data")
data("FishGills3")


high <- subset(FishGills3, Calcium == "High")
medium <- subset(FishGills3, Calcium == "Medium")
low <- subset(FishGills3, Calcium == "Low")

high.mean <- mean(high$GillRate)
medium.mean <- mean(medium$GillRate)
low.mean <- mean(low$GillRate)

high.sd <- sd(high$GillRate)
medium.sd <- sd(medium$GillRate)
low.sd <- sd(low$GillRate)

# check ANOVA Condition 1
nrow(high) >= 30
nrow(medium) >= 30
nrow(low) >= 30

# check ANOVA Condition 2
(max(c(high.sd, medium.sd, low.sd)) / min(c(high.sd, medium.sd, low.sd))) < 2

# boxplot of each group GillRate
plot.data <- cbind(low$GillRate, medium$GillRate, high$GillRate)
boxplot(plot.data, beside=T,
        names=c("low", "medium", "high"),
        xlab="Calcium Concentration",
        ylab="Gill Rate",
       )
 title("BoxPlot of GillRates for Low, Medium, High Calcium Water")

# perform anova
my.aov <- aov(FishGills3$GillRate ~ FishGills3$Calcium)
summary(my.aov)