########################################################################################################################
# Filename:      Lab 6.R
# Description:   R Script for SC212 Lab 6
# Author:        Francis O'Hara
# Date Modified: 12/4/24
########################################################################################################################
library(Lock5Data)

# load data
fev <- read.csv("Week 13/data/fev.csv")
summary(fev)

########################################################################################################################
# generate scatterplot to show relationship between height and FEV
########################################################################################################################
plot(fev$height, fev$fev,
     xlab = "height (In)",
     ylab = "FEV (L)",
     main = "FEV vs. Height",
     pch = 20
)

########################################################################################################################
# compute correlation between height and FEV
########################################################################################################################
r <- cor(fev$height, fev$fev)
r

########################################################################################################################
# conduct hypothesis test to check if 0 is a plausible value for population correlation
########################################################################################################################
# compute degree of freedom and t-value
n <- nrow(fev)
df <- n - 2
SE <- sqrt((1 - (r ^ 2))/df)
t.value <- r/SE
t.value

# compute p-value
p1 <- pt(t.value, df=df)
p1
p.value <- min(p1, 1 - p1) * 2
p.value

########################################################################################################################
# compute least squares regression line relating FEV and height
########################################################################################################################
my.lm <- lm(fev$fev ~ fev$height)
summary(my.lm)

# add regression line to scatterplot
abline(my.lm, col="red")

########################################################################################################################
# plot RVF plot to check variance of residuals as x changes
########################################################################################################################
plot(my.lm$fitted.values, my.lm$residuals,
     xlab = "Fitted values",
     ylab = "Residuals",
     pch = 20,
     main = "RVF Plot",
     abline(0, 0, col="blue")
)

########################################################################################################################
# plot histogram of residuals to check for normality.
########################################################################################################################
hist(my.lm$residuals,
     xlab = "Residuals",
     main = "Histogrom of Residuals"
     )

########################################################################################################################
# perform log transformation of dependent variable since RVFPlot shows non-constant variance
########################################################################################################################
fev$lnfev <- log(fev$fev)
summary(fev)

########################################################################################################################
# run regression and check line inference assumptions with lnfev as dependent variable.
########################################################################################################################
# plot scatterplot
plot(fev$height, fev$lnfev,
     xlab = "Height (In)",
     ylab = "LnFEV",
     main = "Height vs LnFEV",
     pch = 20
)

# compute correlation coefficient
r.2 <- cor(fev$height, fev$lnfev)
r.2

# compute least squares regression solution for lnfev as dependent variable
my.lm.2 <- lm(fev$lnfev ~ fev$height)
summary(my.lm.2)

# plot least squares solution on scatterplot
abline(my.lm.2, col="red")

# plot histogram to check normality of residuals
hist(my.lm.2$residuals,
     xlab = "Residuals",
     main = "Histogram of Residuals"
)

# plot RVFPlot to check for equal variability of lnfev as height changes.
plot(my.lm.2$fitted.values, my.lm.2$residuals,
     pch = 20,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs. Fitted Values",
     abline(0,0, col="blue")
     )

########################################################################################################################
# create multiple linear regression model relating lnfev to height, sex, and smoking.
########################################################################################################################
my.mlm <- lm(fev$lnfev ~ fev$height + fev$smoke + fev$sex)
summary(my.mlm)

# plot histogram of residuals to check normality
hist(my.mlm$residuals,
     xlab = "Residuals",
     main = "Histogram of Residuals"
)

# plot RVF plot to check variability of lnFEV as independent variables change
plot(my.mlm$fitted.values, my.mlm$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values",
     abline(0, 0, col="blue")
)

########################################################################################################################
# check if Age confounds relationship between smoking and lnfev
########################################################################################################################
my.mlm.with.age <- lm(fev$lnfev ~ fev$height + fev$smoke + fev$sex + fev$age)
my.mlm$coefficients
my.mlm.with.age$coefficients

# check change in coefficient of smokes variable
ratio.of.change <- (my.mlm.with.age$coefficients["fev$smokesmoker"] / my.mlm$coefficients["fev$smokesmoker"])
ratio.of.change

# check significance of coefficient of smokes variable in both models
summary(my.mlm)
summary(my.mlm.with.age)