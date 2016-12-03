# Get / set working environment
getwd()
setwd(dir = "C:/Users/room1.05/Downloads/Week3/")


# Vector data type
myVec = c("a", 2, 3, 5.5)
class(myVec)
typeof(myVec)

# Convert to numeric
as.integer(myVec)
myVecN = as.numeric(myVec)
mean(myVecN)  # this gives NA
?mean         # read help to see if you miss something
mean(myVecN, na.rm = TRUE)

# Find the function for computing standard dev 
??"standard deviation"
sd(myVecN, na.rm = TRUE)


# List data type
name = c("Jon", "Ifa", "Amy")
age = c(18, 24, 21)
gender = c("M", F, "M") # Forgot "", introduced wrong data
gender = c("M", "F", "M")
mark = c(85, 95, 70)
myList = list(name, age, gender, mark)

myList        # Will not display if you do source the script (Ctrl+Shift+S)
print(myList) # !!! Get the habit to use print 

# Access elements of list
print(myList[2])         # object (as list)
print(mean(myList[2]))   # warning --> NA
print(myList[[2]])       # object (as vector)
print(mean(myList[[2]])) # OK
print(myList[[2]][2])    # element of object
typeof(myList[[1]])
typeof(myList[[2]])


# Factor data type
nameF = as.factor(gender)
print(nameF)
levels(nameF)
labels(nameF)
c(nameF)          # Wrong: creates vector with labels
as.vector(nameF)  # OK


# Data.frame
myDat = data.frame(name, age, gender, mark)
print(myDat)
class(myDat)
typeof(myDat)

# Convert data.frame to matrix
myDatM = as.matrix(myDat)
print(myDatM)
class(myDatM)
typeof(myDatM)

# Access data
names(myDatM)   # does not work for matrix
names(myDat)
myDat$name      # column
myDat[,1]
myDat[1,]       # row
myDat$name[2]   # cell
myDat[1,2]

length(myDat)       # number variables / attributes
length(myDat$name)  # number observations / instances

summary(myDat)      # basic stats of each column

# subset the data
myDat[1,2]          # Select first 2 columns
# Select desired colums
subset(x = myDat, select = c(1,3))
subset(x = myDat, select = c("name", "mark")) # Preffered approach!!!

# Select males
subset(x = myDat, subset = (myDat$gender == "M") )

# View existing R datasets
library(help = "datasets")
mtc = mtcars    # load dataset into environment
# More complex subset
mtcSet = subset(x = mtc, subset = (mtc$mpg > 20 & mtc$cyl == 4), select = c("mpg", "cyl", "hp"))
summary(mtcSet)



## Input/Output
myFile = file("mydata.txt", open = "w")
write("test", myFile, append = TRUE)
for(i in length(myDat$name)){
  writeLines(text = paste(myDat[,i]), con = myFile, sep = "\n")
}
close(myFile)


# Output tabular data
write.table(x  = myDat, file = "mydata_tab.txt")
write.csv(x = myDatM, file = "mydata.csv")
write.csv(x = myDatM, file = "mydata.csv", row.names = FALSE)

myDatRead = read.csv(file = "mydata.csv", header = TRUE)


# Plot
png(filename = "mpg_hist.png", width = 3, height = 3, units = "in", res = 300)
  hist(x = mtc$mpg, main = "Histogram of MPG", xlab = "MPG", col = "blue")
dev.off()
