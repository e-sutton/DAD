# =========================================
# Dataset attributes
# =========================================  
#  
# age: continuous.  The age of the individual
# workclass: The type of employer the individual has: Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked. 
# fnlwgt: The \# of people the census takers believe that observation represents: continuous.
# education: The highest level of education achieved for that individual: Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool. 
# education-num: Highest level of education in numerical form: continuous. 
# marital-status: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse. 
# occupation: Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical, Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces. 
# relationship: Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried. 
# race: White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black. 
# sex: Female, Male. 
# capital-gain: Capital gains recorded: continuous. 
# capital-loss: Capital Losses recorded: continuous. 
# hours-per-week:  Hours worked per week: continuous. 
# native-country: Country of origin for person: United-States, Cambodia, England, Puerto-Rico, Canada, Germany, Outlying-US(Guam-USVI-etc), India, Japan, Greece, South, China, Cuba, Iran, Honduras, Philippines, Italy, Poland, Jamaica, Vietnam, Mexico, Portugal, Ireland, France, Dominican-Republic, Laos, Ecuador, Taiwan, Haiti, Columbia, Hungary, Guatemala, Nicaragua, Scotland, Thailand, Yugoslavia, El-Salvador, Trinadad&Tobago, Peru, Hong, Holand-Netherlands.
# income: >50K, <=50K



setwd("/Users/Eoin/Documents/BSHCE/Year 4/DAD/DAD") #<-- change this to where you have downloaded the csv
data <- read.csv("adult.data.csv",stringsAsFactors = F)

set.seed(13116053) # <-- put your student number here WITHOUT the x!! Leave off a starting zero if you have one
#e.g.: set.seed(62345678)
my_dataset <- data[order(runif(5000)), ]

#output this if you want to use something other than R
write.csv(file="mydata.csv", my_dataset)


#------------------------------------------------
#Start Foundations
#libraries
library(ggplot2)


#------------------------------------------------
#Start of answers

#Start B1
View(my_dataset)
missingvalues = sum(is.na(my_dataset))
subsetwork = subset(my_dataset$workclass, workclass == "?")
workclasssubset = subset(x = my_dataset, subset = (my_dataset$workclass == "?") )
workclassNA = length(which(my_dataset$workclass == "?"))

workclassNA = data.frame(factor(my_dataset$workclass, levels=c("?"), labels=c(NA)))

idx <- my_dataset == " ?"
length(idx)


#start B2
summary(my_dataset)
agesort = sort(my_dataset$age, decreasing = TRUE)
top10 = head(agesort,10)
View(top10)

edusort = sort(my_dataset$education, decreasing = TRUE)
top10edu = head(edusort,10)
View(top10edu)
#startB3
sort(table(my_dataset$native_country), decreasing = TRUE)

#startB4
avgAge = mean(my_dataset$age)
avgCapGain = mean(my_dataset$capital_gain)
avgWorkHours = mean(my_dataset$hr_per_week)


#startB5a
ggplot(data=my_dataset$education_num, aes(as.numberic(hr_per_week), as.numeric(income)) +
  geom_violin(fill="lightblue") +
  geom_boxplot( alpha=.2)

  

#startI1
subsetFemales = subset(my_dataset, sex == "Female")

#write out
myfile = file("mydata.csv", open = "w")
write.csv(my_dataset, file = myfile, row.names = FALSE)
close(myfile)


