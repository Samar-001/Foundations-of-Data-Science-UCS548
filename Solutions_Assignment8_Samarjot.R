"Samarjot Singh          Assignment 8"


# Step 1: Random Number and Plot
x <- runif(100, min = 1, max = 5)
print(x)
y <- x^2 + runif(100)
print(y)

# 1.1 Plot x
plot(x)
plot(x, main = "X data")
plot(x, main = "X data",xlab = "X Axis", ylab="Y Axis")

# 1.2 Scatter Plot; x vs y
plot(x, y, main = "Scatter plot",xlab = "X Axis", ylab="Y Axis")

# 1.3 Saving the Plot to a file
png(filename="MyPlot.png")
plot(x, y, main = "Scatter plot",xlab = "X Axis", ylab="Y Axis")
dev.off()
getwd()   # Get the Current Working Directory, Similar to pwd in linux


# Step 2: The Normal Distribution
x1 <- rnorm(10,sd=2)
print(x1)
x2 <- rnorm(10,sd=3)
print(x2)
x3 <- rnorm(10,sd=4)
print(x3)

# Plot x1,x2,x3 together
df <- data.frame(x1,x2,x3)
plot(df[,1:3])


# Step 3: Min, Max, Sum, Std Deviation
x <- c(2,7,3,2,4,1,8,2,4,2,8,-5,4)
min(x)
max(x)
sum(x)
sd(x)

mean(x)
median(x)

findmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

findmode(x)


# Step 4: Correlation, Variance and Covariance (Matrices) 
x <- c(2,7,3,2,4,1,8,2,4,2,8,-5,4)
y <- c(6,3,8,1,3,6,8,2,3,5,8,4,-6)
z <- round(runif(13,min=-10, max=10),0) 

# Variance
var(x, y)

# Co-variance
cov(x, y, method = "pearson")
cov(x, y, method = "kendall")
cov(x, y, method = "spearman")

# Correlation
cor(x, y, method = "pearson")
cor(x, y, method = "kendall")
cor(x, y, method = "spearman")

# Pairwise correlation
df <- data.frame(x,y,z)
pairCor <- cor(df,use="pairwise",method="pearson")
print(pairCor)

# Visualize correlation of all variable with each other
install.packages("corrplot")
library(corrplot)
corrplot(pairCor)


# Step 5: Linear Regression
x <- c(173, 169, 176, 166, 161, 164, 160, 158, 180, 187)
y <- c(80, 68, 72, 75, 70, 65, 62, 60, 85, 92) 

linearModel <- lm(y ~ x)
plot(x, y)
abline(linearModel, lwd=2)
predicted <- predict(linearModel) 
segments(x, y, x, predicted, col="red")


# Step 6: Basic Plots using ggplot
install.packages("ggplot2")
library(ggplot2)

data(diamonds)  # Loading build-in dataset
head(diamonds)
summary(diamonds) #Summarize the dataset

# 6.1 Histogram
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")

plot(price ~ carat, data = diamonds)
plot(diamonds$carat, diamonds$price)


# 6.2 Boxplots
boxplot(diamonds$carat)
boxplot(diamonds)
boxplot(diamonds[,-c(7)]) # dropping carat column


# 6.3 Histograms and Densities
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")

# Scatter Plot
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

g <- ggplot(diamonds, aes(x = carat, y = price))
g + geom_point(aes(color = color))
g + geom_point(aes(color = color)) + facet_wrap(~color)
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)


ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

ggplot(diamonds, aes(y = carat, x = cut)) + geom_point() + geom_violin()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() + geom_point()

ggplot(economics, aes(x = date, y = pop)) + geom_line()


# 6.3 More Plots using ggplots
install.packages("lubridate")
install.packages("scales")

library(lubridate)
library(scales)
economics$year <- year(economics$date)
economics$month <- month(economics$date, label=TRUE)
econ2000 <- economics[which(economics$year >= 2000), ]

# build the foundation of the plot
g <- ggplot(econ2000, aes(x=month, y=pop))

# add lines color coded and grouped by year
# the group aesthetic breaks the data into separate groups
g <- g + geom_line(aes(color=factor(year), group=year))

# name the legend "Year"
g <- g + scale_color_discrete(name="Year")

# format the y axis
g <- g + scale_y_continuous(labels=comma)

# add a title and axis labels
g <- g + labs(title="Population Growth", x="Month", y="Population")

# plot the graph
g


# 6.4 Mpore on ggplots
install.packages("ggthemes")
library(ggthemes)
# build a plot and store it in g2
g2 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=color))
# apply a few themes
g2 + theme_economist() + scale_colour_economist()
g2 + theme_excel() + scale_colour_excel()
g2 + theme_tufte()
g2 + theme_wsj()


# Step 7: Grid and a curve plotting
x <- round(runif(13,min=-5, max=5),0) 
y <- round(runif(13,min=-5, max=5),0) 
z <- round(runif(13,min=-5, max=5),0) 

plot(z, type = "n")
grid(lty = 1, lwd = 2)
curve(x^2, col = "blue", add = TRUE)
curve(x^2 + 1, col = "blue", add = TRUE)
points(z^2, pch = 20)


# Step 8: Grphical Parameters
plot(z, type = "o", col = 'red', pch = 16, cex = 2)
plot(z, col = c('red', 'blue'), pch = "+", cex = 2)


# Step 9: Colors Plotting
colors()
palette() ## default palette
palette(sample(colors(), 10)) ## change palette
plot(runif(50), col = rep(1:10, each = 5), pch = 16, cex = 2)


# Step 10: Histogram Plotting - Frequency Plotting
# create a grouping variable of length 100
a <- factor(sample(1:5, 13, replace = TRUE), levels = 1:5)
print(a)
levels(a) <- LETTERS[1:5]
print(a)
plot(a)
plot(y ~ a)   # Box Plot


# Step 11: Plotting of Data frames 
# scatterplot matrix: a matrix of all pairwise bivariate scatterplots.
iris        # Dataset
head(iris)
class(iris)
plot(iris)
plot(iris[1:4], col = as.numeric(iris$Species)) # color by Species


# Step 12: Function Plotting
plot(sin, from = -2 * pi, to = 2 * pi)
plot(cos, from = -2 * pi, to = 2 * pi)

damped.sin <- function(x) sin(5 * x) * exp(-x^2) ## New function
class(damped.sin)
plot(damped.sin, from = -pi, to = pi)