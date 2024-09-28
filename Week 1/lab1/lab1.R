surveydata <- read.csv(file= "surveydata.csv")
head(surveydata)
View(surveydata)
names(surveydata)
surveydata$salary
data(BaseballHits2014)
attach(BaseballHits2014)
mean(HomeRuns)
detach(BaseballHits2014)

# Tutorial
plot(c(1,2,3,4,5), c(1,2,3,4,5))
