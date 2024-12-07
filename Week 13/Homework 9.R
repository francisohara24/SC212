########################################################################################################################
# Filename:      Homework 9.R
# Description:   R Scripts for SC212 Homework 9
# Author:        Francis O'Hara
# Date Modified: 12/1/24
########################################################################################################################

library(Lock5Data)

########################################################################################################################
# Question 9.22) Inference on the Slope of Facebook Friends and the Brain
########################################################################################################################
data(FacebookFriends)

# compute linear model for predicting facebook friends from brain grey matter density
my.lm <- lm(FacebookFriends$FBfriends ~ FacebookFriends$GMdensity)
summary(my.lm)

# check linearity with scatterplot
plot(FacebookFriends$GMdensity, FacebookFriends$FBfriends,
     xlab = "GMDensity",
     ylab = "FBfriends",
     main = "Least Squares Regression line for predicting FBFriends from GMDensity",
     abline(my.lm, col="red")
     )

# check if residuals are normally distributed
hist(my.lm$residuals,
     xlab = "Residual",
     main = "Histogram of Residuals"
     )

# check equal variability with residuals vs fitted plot (RVFPlot)
plot(my.lm$fitted.values, my.lm$residuals,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "RVF Plot",
     abline(0, 0, col = "red")
     )

# confidence interval
data("StudentSurvey")
summary(StudentSurvey)
my.lm <- lm(StudentSurvey$GPA ~ StudentSurvey$VerbalSAT)


predict(my.lm, newdata = c(500), int="confidence")
