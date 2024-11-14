########################################################################################################################
# Filename:      Lab 5.R
# Description:   R Scripts for SC212 Lab 5
# Author:        Francis O'Hara
# Date Modified: 11/11/24
########################################################################################################################

########################################################################################################################
# Q1) Conduct a test of whether the baseline blood pressures significantly differ between the nifedipine and propranolol
# groups at the 5% level.  The variable “baseline” contains the baseline blood pressures, “final” contains the final
# blood pressure, and “med” contains the indicator of medication group.
# Q2 (4 points):  Report the test statistic and p-value.  What is your conclusion?
# Does this make sense given that we are making the comparison at the beginning of the study?
########################################################################################################################
data <- read.csv(file="Week 11/data/hbp.csv")
nifedipine.baseline <- data$baseline[0:18]
nifedipine.final <- data$final[0:18]
propranolol.baseline <- data$baseline[19:nrow(data)]
propranolol.final <- data$final[19:nrow(data)]

t.test(data$baseline ~ data$med, alternative="two.sided")

########################################################################################################################
# Q3 (1 point):  What are the appropriate null and alternative hypotheses for this test comparing baseline to final in
# the nifedipine group?
# Q4 (3 points):  Report the test statistic and p-value.  What do you conclude?
########################################################################################################################
nif.df <- subset(data, med=="Nifedipine")
nif.df
t.test(nif.df$baseline, nif.df$final, paired=TRUE)

########################################################################################################################
# Q5 (1 point):  Repeat the above process for those that took propranolol.  What are your null and alternative hypotheses?
########################################################################################################################
pro.df <- subset(data, med=="Propranolol")
pro.df
t.test(pro.df$baseline, pro.df$final, paired=TRUE)

########################################################################################################################
# Perform a chi-square contingency table test to determine if there is a significant association between treatment and
# response.
########################################################################################################################
# read two way table
my.data <- matrix(c(40,30,130,
                    10,20,70,
                    15,40,45), nrow = 3, byrow = TRUE)
colnames(my.data) <- c('smear+', 'culture+', 'negative')
rownames(my.data) <- c('Penicillin', 'Low Spect', 'High Spect')
my.data

# conduct chi square test of assocition
my.test <- chisq.test(my.data)
my.test

# check expected cell counts for condition: each count > 5
my.test$expected

########################################################################################################################
# Dorm type and alcohol consumption
#
# Is dorm type associated with alcohol consumption?  Colby college students were asked:  “Which type of dorm do you
# currently live in – Chemical-free, Normal, or Quiet?” and “Do you consume alcohol – yes or no?”
# Q11 (1 point):  What is the smallest expected count for these data?
########################################################################################################################
dorm.data <- matrix(c(31, 18,
                    123, 6,
                    11, 8), nrow = 3, byrow = TRUE)
colnames(dorm.data) <- c('drink.yes', 'drink.no')
rownames(dorm.data) <- c('Chem Free', 'Normal', 'Quiet')
dorm.data

# computed expected counts with chisquare test
chisq.test(dorm.data)$expected

########################################################################################################################
# Q12 (2 points):  Perform Fisher’s exact test on these data and provide a p-value.  What do you conclude?
########################################################################################################################
my.test2 <- fisher.test(dorm.data)
my.test2$p.value