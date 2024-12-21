########################################################################################################################
# Filename:      Lab 2.R
# Description:   R Scripts for SC212 Lab 2
# Author:        Francis O'Hara
# Date Modified: 12/21/2024
########################################################################################################################
library(Lock5Data)
data(NutritionStudy)

# summarize dataframe
str(NutritionStudy)

# summarize any numeric variable in dataframe
summary(NutritionStudy$Calories)

# summarize the cholesterol variable
summary(NutritionStudy$Cholesterol)

# generate histogram of cholesterol variable
hist(NutritionStudy$Cholesterol)

# generate boxplot of cholesterol variable
boxplot(NutritionStudy$Cholesterol,
        main = "Boxplot of Cholesterol")

# create a label-less barchart for the smoke variable
barplot(table(NutritionStudy$Smoke))

# create a labelled barchart for the smoke variable
barplot(table(NutritionStudy$Smoke),
        main = "Barchart of Smoke variable",
        ylab = "Counts"
)

# create contingency table of sex and vitamin use
my.table <- table(NutritionStudy$Sex, NutritionStudy$VitaminUse)
my.table

# create mosaic plot of above contingency table
mosaicplot(my.table, color = c("Red", "Green", "Orange"))

# create side-by-side bar chart of above contingency table
barplot(my.table, legend = TRUE, beside = TRUE,
        main = "Barplot of Vitamin Use against Sex",
        ylab = "Counts",
        xlab = "Vitamin Use"
)

# create boxplots of cholesterol by vitamin use
boxplot(NutritionStudy$Cholesterol ~ NutritionStudy$VitaminUse,
        main = "Boxplots of Cholesterol by Vitamin Use")

# create scatterplot of cholesterol against age
plot(NutritionStudy$Age, NutritionStudy$Cholesterol,
     main = "Scatterplot of Cholesterol vs Age",
     xlab = "Age",
     ylab = "Cholesterol",
     pch = 20
     )