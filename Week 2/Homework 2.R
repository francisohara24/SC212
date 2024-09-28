# Question 2.50
library(Lock5Data)
data(CollegeScores)
my.table <- table(CollegeScores$MainDegree)
my.prop.table <- prop.table(my.table)
percentages <- my.prop.table * 100

my.table
my.prop.table
percentages


# Question 2.90
data(AllCountries)
hist(AllCountries$DeathRate, 
     col="lightblue",
     xlab="Death Rate Per 1000 people",
     main="Histogram of Death Rate of All Countries in the Dataset",
     breaks=40)

# Question 2.150
data(PASeniors)
mean(PASeniors$HWHours, na.rm=TRUE)
sd(PASeniors$HWHours, na.rm=TRUE)

# Question 2.176
data(HoneybeeCircuits)
boxplot(HoneybeeCircuits$Circuits ~ HoneybeeCircuits$Quality, data=HoneybeeCircuits)
max(subset(HoneybeeCircuits, HoneybeeCircuits$Quality=="Low")$Circuits)
max(subset(HoneybeeCircuits, HoneybeeCircuits$Quality=="High")$Circuits)

# Question 2.184
data("StudentSurvey")
summary(StudentSurvey)
boxplot(StudentSurvey$Height ~ StudentSurvey$Sex, data=StudentSurvey,
        xlab="Sex",
        ylab="Height (in inches)",
        main="Summary of Heights by Sex")
mean(subset(StudentSurvey, StudentSurvey$Sex=="M")$Height, na.rm = TRUE)
sd(subset(StudentSurvey, StudentSurvey$Sex=="M")$Height, na.rm = TRUE)
mean(subset(StudentSurvey, StudentSurvey$Sex=="F")$Height, na.rm = TRUE)
sd(subset(StudentSurvey, StudentSurvey$Sex=="F")$Height, na.rm = TRUE)
?StudentSurvey
??ggplot