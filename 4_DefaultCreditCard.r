install.packages(c("e1071", "C50", "ggplot2", "hexbin","descr", "caret", "e1071"))
library(e1071)
library(hexbin)
library(ggplot2)
library(caret)
library(descr)
library(C50)

#setwd("C:\Users\amoldovan\Desktop")

# First remove first row (i.e., X1, X2 etc.) and export the data as .csv from Excel
data <- read.csv("default of credit card clients.csv", stringsAsFactors=F)
data <- data[-1]
str(data)
View(data)

data$SEX <- factor(data$SEX, levels=c(1, 2), labels=c("M", "F"))

table(data$EDUCATION, useNA='ifany')
table(data$MARRIAGE, useNA='ifany')
data$EDUCATION <- factor(data$EDUCATION, levels=c(0, 1, 2, 3, 4, 5, 6), labels=c(NA, "GS", "UNI", "HS", "O1", "O2", "O3"))
data$MARRIAGE <- factor(data$MARRIAGE, levels=c(0, 1, 2, 3), labels=c(NA, "M", "S", "O"))
data$default.payment.next.month <- factor(data$default.payment.next.month, levels=c(0, 1), labels=c("N", "Y"))


str(data)
summary(data)


# Descriptive statistics and plots
mean(data$LIMIT_BAL)
summary(data$LIMIT_BAL)
median(data$LIMIT_BAL)
sd(data$LIMIT_BAL)
IQR(data$LIMIT_BAL)
mad(data$LIMIT_BAL)
boxplot(data$LIMIT_BAL)
hist(data$LIMIT_BAL, freq=F)
lines(density(data$LIMIT_BAL), lwd=3, col="blue")

ggplot(data, aes(x=LIMIT_BAL, y=AGE)) + stat_binhex(colour="white") +
  theme_bw() + scale_fill_gradient(low="white", high="blue") +
  labs(x="Limit Balance", y="Age")

ggplot(data, aes(x=LIMIT_BAL, y=AGE)) + stat_binhex(colour="white") +
  theme_bw() + scale_fill_gradient(low="white", high="blue") +
  labs(x="Limit Balance", y="Age") +
  facet_wrap("EDUCATION")

CrossTable(data$EDUCATION, data$default.payment.next.month, prop.c=F, prop.t=F, prop.chisq=F)

boxplot(LIMIT_BAL ~ EDUCATION, data=data)
ggplot(data=data, aes(EDUCATION, LIMIT_BAL)) +
  geom_violin(fill="lightblue") +
  geom_boxplot( alpha=.2)


# Randomise data
data_rand <- data[order(runif(10000)), ]
summary(data$LIMIT_BAL)
summary(data_rand$LIMIT_BAL)

# Create test and train subsets
train <- data_rand[1:9000, ]
test <- data_rand[9001:10000, ]
prop.table(table(train$default.payment.next.month))
prop.table(table(test$default.payment.next.month))

# Train the classifier (i.e., decusion tree)
credit_model <- C5.0(train[-24], train$default.payment.next.month)
credit_model

summary(credit_model)

#Evaluate the model
credit_pred <- predict(credit_model, test)

CrossTable(test$default.payment.next.month, credit_pred,prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))

confusionMatrix(credit_pred, test$default.payment.next.month, positive = "Y")
