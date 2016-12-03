celciusInput <- readline("Please enter a celcius value:")
celciusNumeric = as.numeric(celciusInput)
fahrResults = ((9/5)*celciusNumeric)+32
fahrString = sprintf("%.2f", fahrResults)
message = paste("the result is ", fahrString, sep = " ")
print(message)

weight <- as.numeric(readline("What is the kg of the bag? "))
if (weight > 15){
  print("This bag is over the weight limit of 15kg!")
}
print("Thank you")

weight

v1 = c("Eoin","Sutton", "Eoin")
v1
v1[0]
v1 + 5
f = factor(v1)
f

typeof(v1)
is.integer(v1)

name = c("eoin", "john", "mark")
age = c(31,14,35)
employed = c("y","n","y")
salary = c(31000,12000,50000)
dat = data.frame(name,age,employed,salary)
dat
avgSal = mean(dat$salary)
avgSal

salutation <- function(name){
  salutation = paste("hello ", name, " !", sep = " ")
  print(salutation)
}

salutation("Eoin")

#write tabular data
myfile = file("data.txt", open = "w")
write.table(dat,file = myfile, row.names = FALSE)
close(myfile)

#read
myfile = file("data.txt", open = "r")
mydata = read.table(myfile,header = TRUE)
close(myfile)
mydata


#read credit card data xls file

ccdata = read.csv("default of credit card clients-2.csv", stringsAsFactors = F)
ccdata = ccdata[-1]
View(ccdata)
str(ccdata)
ccdata$SEX = factor(ccdata$SEX, levels=c(1, 2), labels=c("M", "F"))
ccdata

#histogram
png("Histrogram test.png", width = 5, height = 5, units = "in", res = 300)
hist(salData$TotalPay, breaks = 12, main = "Histogram test bitch!", xlab = "huh?")
dev.off()

#barplot
counts <- table(salData$Id)
png("barplot test.png", width = 5, height = 5, units = "in", res = 300)
barplot(counts, xlab = "num users", ylab = "??")
title(main="Barplot")
dev.off()

#intro to R practical exercises
myfile = file("numbers.txt", open = "w")
write(42, myfile, append = TRUE)
write(21, myfile, sep = "\n")
write(12, myfile, sep = "\n")
write(74, myfile, sep = "\n")
close(myfile)

readInput <- function(filename){
  myfile2 = file(filename, open = "r")
  vectorOfNumbers = c()
  mylines = readLines(myfile2)
  for (i in 1:length(mylines)) {
    vectorOfNumbers = c(vectorOfNumbers, as.numeric(mylines[i]))
    #print(mylines[i])
  }
  close(myfile2)
  return(vectorOfNumbers)
  
}

readInput("numbers.txt")

#compute averate
calAvg <- function(vectors){
  return(sum(vectors)/length(vectors))
}

calAvg(readInput("numbers.txt"))

#write to output
writeOut <- function(filename,num){
  myfile3 = file(filename, open = "w")
  write(num, myfile3)
  close(myfile3)
}

writeOut("testnums.txt",4)

#random
data_rand <- data[order(runif(10000)), ]
View(data_rand)
