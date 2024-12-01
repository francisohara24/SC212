########################################################################################################################
# Filename:      Chapter 9.R
# Description:   R Scripts for SC212 Chapter 9 Reading
# Author:        Francis O'Hara
# Date Modified: 11/17/24
########################################################################################################################
library(Lock5Data)
data(InkjetPrinters)

# compute regression line
my.lm <- lm(InkjetPrinters$Price ~ InkjetPrinters$PPM)
summary(my.lm)

# plot data and regression line
plot(InkjetPrinters$PPM, InkjetPrinters$Price,
     xlab = "Pages Per Minute",
     ylab = "Price",
     main = "Regression Line (PPM vs Price)"
)
abline(my.lm,
       col = "red")

# compute 95% confidence interval for population slope of regression line
t.star <- qt(0.975, df=length(InkjetPrinters$Price) - 2)
sample.slope <- 90.88
SE <-  19.49  # from regression output
CI <- c(sample.slope - (t.star * SE), sample.slope + (t.star * SE))
CI