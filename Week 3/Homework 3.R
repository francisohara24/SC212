###########################################################
# Question 2.248
library(Lock5Data)
data(HoneyBeeWaggle)

# find correlation of duration and distance
cor(HoneybeeWaggle$Duration, HoneybeeWaggle$Distance)

# train linear model to predict distance from duration
my.lm <- lm(HoneybeeWaggle$Distance ~ HoneybeeWaggle$Duration)
my.lm$coefficients

# plot scatter plot and regression line
plot(HoneybeeWaggle$Duration, HoneybeeWaggle$Distance)
abline(my.lm)

###########################################################
# Question 2.60
data("Honeybee")

# train linear model to predict `Colonies` from `Year`
my.lm <- lm(Honeybee$Colonies ~ Honeybee$Year)
my.lm$coefficients
plot(Honeybee$Year, Honeybee$Colonies,
     main = "Linear Regression Line and Scatterplot of Year Against No. of Colonies",
     xlab = "Year (in calendar year)",
     ylab = "Number of Colonies (in thousands)",
     col = "blue")
abline(my.lm,
       col = "red")
legend("bottomleft",
       legend = c("Scatterplot", "Regression Line"),
       fill = c("blue", "red"))

###########################################################
# Question A.92
x <- c(2, 1, 4, 5, 3)
y <- c(5, 3, 4, 3, 4)

# plot Scatterplot of X and Y
plot(x, y,
     main = "Scatterplot of X versus Y",
     xlab = "X",
     ylab = "Y",
     col="black"
)

# calculate correlation of X and Y
cor(x, y)

# add outlier datapoints to X and Y
x <- c(x, 10)
y <- c(y, 10)

# plot new scatterplot of X and Y
plot(x, y,
     main = "Scatterplot of X versus Y (with outliers)",
     xlab = "X",
     ylab = "Y",
     col="black"
)

# calculate new correlation of X and Y
cor(x, y)

###########################################################
# Question 3.36
# Find minimum and maximum yearly salary from the YearlySalary column of the  NFL Contracts 2019 dataset
data(NFLContracts2019)
min(NFLContracts2019$YearlySalary)
max(NFLContracts2019$YearlySalary)