"Samarjot Singh        Assignment 8.1"

library(reshape2)
library(dplyr)

# Q1
"Reading the dataset"
project1 <- read.csv(file = "./ex12_normalized_intensities.csv")
"First 10 records of dataset are"
head(project1, 10)

# Q1.1
"Method 1"
plot(project1$sampleB, project1$sampleH, main = "Gene Expressions",xlab = "Sample B", ylab="Sample H")

"Method 2"
ggplot(data=project1, mapping=aes(x=sampleB, y=sampleH)) + geom_point()

# Q1.2
"Method 1"
project1$expr_limits <- "normal"
project1$expr_limits[project1$sampleB > 13 & project1$sampleH > 13] <- "high"
project1$expr_limits[project1$sampleB < 6 & project1$sampleH < 6] <- "low"

"Method 2"
project1$expr_limits <- vector(mode="character",length=1000)
for(i in 1:1000){
  if(project1$sampleB[i]>13 & project1$sampleH[i]>13){
      project1$expr_limits[i] <- "high"
  }
  else if(project1$sampleB[i]<6 & project1$sampleH[i]<6){
      project1$expr_limits[i] <- "low"
  }
  else{
    project1$expr_limits[i] <- "normal"
  }
}

"Printing 25 values"
head(project1[c("sampleB", "sampleH", "expr_limits")], 25)

# Q1.3
"Method 1"
p <- ggplot(data=project1, mapping=aes(x=sampleB, y=sampleH, color=expr_limits)) + geom_point()
p

"Method 2"
p <- ggplot(project1, aes(x = sampleB, y = sampleH))
p <- p + geom_point(aes(color=factor(expr_limits), group=expr_limits))
p <- p + labs(title="Sample B vs Sample H", x="Sample B", y="Sample H")
p

# Q1.4
boxplot(project1[,-c(1, 10)])

# Q1.5
ggplot(melt(project1),aes(x=variable,y=value,color=expr_limits)) +geom_boxplot()

# Q1.6
gbar <- ggplot(data=project1, mapping=aes(x=expr_limits)) + geom_bar()
gbar