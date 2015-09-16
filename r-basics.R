counts_raw <- read.delim("data/counts-raw.txt.gz")
dim(counts_raw)
head(counts_raw)
tail(counts_raw)
counts_raw[1,10]
counts_raw[1:3,10:12]
counts_raw[1:3,] ; names(counts_raw)
counts_raw[1:10,"pmid"]
str(counts_raw$daysSincePublished)
head(counts_raw$daysSincePublished / 7 ) # if you use c(7,1) vector divison will alternate 
# between dividing by 7 and 1 - R "RECYLES"
is.numeric(counts_raw$daysSincePublished)
str(counts_raw$journal) # Note: factors stored as numbers 
levels(counts_raw$journal)
counts_raw$authorsCount[1:10]
is.na(counts_raw$authorsCount[1:10])
anyNA(counts_raw$authorsCount[1:10])
summary(counts_raw$wosCountThru2011)
hist(counts_raw$wosCountThru2011)
hist(sqrt(counts_raw$wosCountThru2011))
plot(counts_raw$daysSincePublished,counts_raw$wosCountThru2011)
## Conditional Statements 
counts_raw$authorsCount[1:10] > 7 
counts_raw$authorsCount[1:10] == 7 
counts_raw$authorsCount[1:10] != 7 
dim(counts_raw[counts_raw$journal == "pone",])
dim(counts_raw[counts_raw$journal != "pone",])
dim(counts_raw[counts_raw$journal %in% c("pone","pbio","pgen"),])
dim(counts_raw[grepl("Immunology",counts_raw$plosSubjectTags),])
head(counts_raw$plosSubjectTags)
if (anyNA(counts_raw$authorsCount)) { 
  print("Be Careful!")
} else { 
  print("Looking good!")
}

if (anyNA(c(1,1,1,1))) { 
  print("Be Careful!")
} else { 
  print("Looking good!")
}

# Looping 
for (i in c("cat","dog","mouse")) { 
  print("Tacos?")
} 

# inefficeint method 
x <- numeric()
for (i in 1:length(counts_raw$wosCountThru2011)){
  x <- c(x, counts_raw$wosCountThru2011[i] + 1)
}

# Better way 

x <- numeric(length=length(counts_raw$wosCountThru2011))
for (i in 1:length(counts_raw$wosCountThru2011)) {
  x[i] <- counts_raw$wosCountThru2011[i] + 1 
}

levels(counts_raw$journal)
results <- numeric(length=length(levels(counts_raw$journal)))
names(results) <- levels(counts_raw$journal)
results["pone"]

for (j in levels(counts_raw$journal)) { 
  results[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal== j])
}