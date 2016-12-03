# First we need to actually make a file, with some content in it
myfile = file("numbers.txt", open = "w")
write(1, myfile, append = T)
write(2, myfile, sep = "\n")
write(3, myfile, sep = "\n")
write(4, myfile, sep = "\n")
close(myfile)

# Function to read numbers
readNumbers <- function(filename) {
  inputFile = file(filename, open="r")
  vectorOfNumbers = c()
  lines = readLines(inputFile)
  for (i in 1:length(lines)){
    vectorOfNumbers = c(vectorOfNumbers, as.numeric(lines[i]))
  }
  close(inputFile)
  return(vectorOfNumbers)
}

# Function to compute average
calcAverage <- function(v) { 
  return (sum(v)/length(v))
}

# Function to write output
writeAv <- function(filename, num){
  outFile <- file(filename, open="w")
  write(as.character(num), outFile)
  close(outFile)
}

readFrom <- "Numbers.txt"
writeTo <- "RAverage.txt"
writeAv(writeTo,calcAverage(readNumbers(readFrom)))