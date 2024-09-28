######################################################################################
# Filename:      lab1.R
# Description:   R Scripts for SC212 Lab 1
# Author:        Francis O'Hara
# Date Modified: 9/16/24
######################################################################################
surveydata <- read.csv(file= "surveydata.csv")
head(surveydata)
View(surveydata)
names(surveydata)
surveydata$salary
data(BaseballHits2014)
attach(BaseballHits2014)
mean(HomeRuns)
detach(BaseballHits2014)

# Scatterplot Tutorial
plot(c(1,2,3,4,5), c(1,2,3,4,5))
