######################################################################################
# Filename:      Lab 3.R
# Description:   R Scripts for SC212 Lab 3
# Author:        Francis O'Hara
# Date Modified: 9/30/24
######################################################################################

# load the data
data <- read.csv("./Week 4/data/fev.csv")
str(data)

# plot scatter plot of height vs lung function (FEV)
plot(data$height, data$fev,
     main = "Scatter Plot of Height versus Forced Expiratory Volume",
     xlab = "Height (inches)",
     ylab = "FEV (liters)")

######################################################################################
# Q1: Yes, the relationship between the variables is approximately linear
######################################################################################

# calculate correlation between height and lung function (FEV)
cor(data$height, data$fev)

######################################################################################
# Q2: Yes, height and fev are positively correlated. Their exact correlation is 0.868135.
######################################################################################

# train linear regression model to determine best fit line for prediciting FEV from height
my.lm <- lm(data$fev ~ data$height)
summary(my.lm)
my.lm$coefficients  # retrieve only slope and y-intercept of best fit line

######################################################################################
# Q3: The equation of the regression line is:
# fev = (height x 0.1319756) - 5.4326788
######################################################################################

######################################################################################
# Q4: Every inch increase in the height of the child is associated with an increase in the Forced Expiratory Volumne by 0.1319756 liters.
# Additionally, if a child were to have a height of 0 inches (beyond the range of the data), they would have a Forced Expiratory Volume (FEV) of -5.4326788.
# The intercept is essentially not interpretable in this setting.
######################################################################################

# list attributes of a linear model object
names(my.lm)

# list all fitted values produced by the model
my.lm$fitted.values

# add regression line to scatterplot
abline(my.lm,
       col="red")
legend("topleft",
       legend=c("Scatterplot of height against FEV", "Regression Line"),
        fill=c("black", "red"))

# plot scatter plot of residuals vs the fitted values of the linear model
plot(my.lm$fitted.values, my.lm$residuals,
     main = "Scatterplot of Residuals against Fitted Values of Linear Model",
xlab = "Fitted_values",
     ylab = "Residuals")
abline(h=0, col="blue")