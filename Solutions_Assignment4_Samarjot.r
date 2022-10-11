"Samarjot Singh        Assignment 4"

# Q1
a <- seq(1.3,4.9,by=0.3)
b <- rep(c(1,2,3,4),times=5)
c <- seq(14,0,by=-2)
d <- rep(c(5,12,13,20),each=2)
a
b
c
d


# Q2
library(datasets)
data(iris)

# (a)
"Structure of Iris dataset is:"
str(iris)

# (b)
cat("  Iris dataset has",nrow(iris),"rows and",ncol(iris),"columns.")
"Summary of Iris dataset is:"
summary(iris)

# (c)
"The variable Species is a factor with 3 levels."
print(factor(iris$Species))


# Q3
# (a)
cat("  Mean of the sepal length of Setosa flowers is",mean(iris[iris$Species == "setosa", ]$Sepal.Length))
cat("  Mean of the sepal width of Setosa flowers is",mean(iris[iris$Species == "setosa", ]$Sepal.Width))
cat("  Standard Devition of the sepal length of Setosa flowers is",sd(iris[iris$Species == "setosa", ]$Sepal.Length))
cat("  Standard Devition of the sepal width of Setosa flowers is",sd(iris[iris$Species == "setosa", ]$Sepal.Width))

cat("  Mean of the sepal length of Versicolor flowers is",mean(iris[iris$Species == "versicolor", ]$Sepal.Length))
cat("  Mean of the sepal width of Versicolor flowers is",mean(iris[iris$Species == "versicolor", ]$Sepal.Width))
cat("  Standard Devition of the sepal length of Versicolor flowers is",sd(iris[iris$Species == "versicolor", ]$Sepal.Length))
cat("  Standard Devition of the sepal width of Versicolor flowers is",sd(iris[iris$Species == "versicolor", ]$Sepal.Width))

cat("  Mean of the sepal length of Virginica flowers is",mean(iris[iris$Species == "virginica", ]$Sepal.Length))
cat("  Mean of the sepal width of Virginica flowers is",mean(iris[iris$Species == "virginica", ]$Sepal.Width))
cat("  Standard Devition of the sepal length of Virginica flowers is",sd(iris[iris$Species == "virginica", ]$Sepal.Length))
cat("  Standard Devition of the sepal width of Virginica flowers is",sd(iris[iris$Species == "virginica", ]$Sepal.Width))

# (b)
iris.class <- iris
iris.class$Calyx.Width <- vector(mode="character",length=150)

for(i in 1:150){
    if(iris.class$Sepal.Length[i]<5){
        iris.class$Calyx.Width[i] <- "short"
    }
    else{
        iris.class$Calyx.Width[i] <- "long"
    }
}

iris.class


# Q4
data(mtcars)
str(mtcars)

# (a)
mtcars[mtcars$cyl >= 5, ]

# (b)
head(mtcars,10)

# (c)
mtcars[substr(row.names(mtcars),1,5) == "Honda", ]