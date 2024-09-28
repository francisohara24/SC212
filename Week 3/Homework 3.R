# Question 2.248
library(Lock5Data)
data(HoneyBeeWaggle)

cor(HoneybeeWaggle$Duration, HoneybeeWaggle$Distance)

my.lm <- lm(HoneybeeWaggle$Distance ~ HoneybeeWaggle$Duration)
my.lm$coefficients
plot(HoneybeeWaggle$Duration, HoneybeeWaggle$Distance)
abline(my.lm)


# Question 2.60
data("Honeybee")

my.lm <- lm(Honeybee$Colonies ~ Honeybee$Year)
my.lm$coefficients
plot(Honeybee$Year, Honeybee$Colonies,
     main="Linear Regression Line and Scatterplot of Year Against No. of Colonies",
     xlab="Year (in calendar year)",
     ylab="Number of Colonies (in thousands)",
     col="blue")
abline(my.lm,
       col="red")
legend("bottomleft",
       legend=c("Scatterplot", "Regression Line"),
       fill = c("blue","red"))


# Question A.92

