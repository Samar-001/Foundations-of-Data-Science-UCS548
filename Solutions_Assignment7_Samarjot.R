"Samarjot Singh        Assignment 7"

library(dplyr)

# Q1
"Reading the marks dataset"
dsg <- read.csv(file = "./StudentMarksDataset.csv")
"First 10 records of marks dataset are"
head(dsg, 10)

"Creating marks matrix"
marks <- matrix(data = c(dsg$SUB1, dsg$SUB2, dsg$SUB3), nrow = 20, ncol = 3)
print(marks)

# Q1(a)
"Total marks of each student"
tot_marks <- apply(marks, 1, sum)
print(tot_marks)

# Q1(b)
"Appending total to the given marks dataset"
dsg <- dsg %>% mutate(Total_Marks = tot_marks)
print(marks)

# Q1(c)
"Finding the standard error in SUB1, SUB2, & SUB3"
sd_marks <- apply(marks, 2, function(x) sd(x)/sqrt(length(x)))
print(sd_marks)

# Q1(d)
"Adding 0.25 bonus marks to each mark in SUB1, SUB2 and SUB3"
new_marks <- apply(marks, 2, function(x) x+0.25)
print(new_marks)


# Q2
"Creating three vectors V1, V2, & V3 from the SUB1, SUB2, & SUB3"
v1 <- new_marks[, 1]
v2 <- new_marks[, 2]
v3 <- new_marks[, 3]

sum_v123 <- rowSums(array(c(v1, v2, v3), dim = c(20, 3)))
print(data.frame(Name = dsg$Name, Total_Marks = sum_v123))


# Q3
"Creating TOTAL_SUM vector with sums of V1, V2 & V3"
v123 <- list(v1 = v1, v2 = v2, v3 = v3)  
Total_sum <- sapply(v123, sum)
print(Total_sum)


# Q4
"Square of each value in V1, V2 & V3"
sapply(v123, function(x) x^2)


# Q5
"Computing mean() and sd() of SUB1 based on index I"
I <- c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4)
marks <- matrix(data = c(marks, I), nrow = 20, ncol = 4)
print(marks)

mean_sub1 <- tapply(marks[, 1], marks[, 4], mean)
print(mean_sub1)
sd_sub1 <- tapply(marks[, 1], marks[, 4], sd)
print(sd_sub1)


# Q6
"Calculating V1/V2 using mapply()"
v1byv2 <- mapply(function(x, y) x/y, v1,  v2)
print(v1byv2)


# Q7
"Importing the seatbelts dataset"
data(Seatbelts)
"First 10 records of seatbelts dataset are"
head(Seatbelts, 10)
"Summary of seatbelts dataset"
summary(Seatbelts)

"tapply"
"Mean of drivers killed each year"
mean_yearwise_driverskilled <- tapply(Seatbelts[, 1], floor(time(Seatbelts)), mean)
print(mean_yearwise_driverskilled)

"Mean of petrol price each year"
mean_yearwise_petrolprice <- tapply(Seatbelts[, 6], floor(time(Seatbelts)), mean)
print(mean_yearwise_petrolprice)

"Mean of van killed each year"
mean_yearwise_vankilled <- tapply(Seatbelts[, 7], floor(time(Seatbelts)), mean)
print(mean_yearwise_vankilled)

"apply"
"Mean of every column of seatbels dataset"
mean_seatbelts_col <- apply(Seatbelts, 2, mean)
print(mean_seatbelts_col)

"Standard Deviation of every column of seatbels dataset"
sd_seatbelts_col <- apply(Seatbelts, 2, sd)
print(sd_seatbelts_col)

"Variance of every column of seatbels dataset"
var_seatbelts_col <- apply(Seatbelts, 2, var)
print(var_seatbelts_col)

"mapply"
"Ratio of drivers killed to drivrs"
driverskilledbydrivers <- mapply(function(x, y) x/y, Seatbelts[, 1],  Seatbelts[, 2])
print(driverskilledbydrivers)

"Ratio of front to rear"
frontbyrear <- mapply(function(x, y) x/y, Seatbelts[, 3],  Seatbelts[, 4])
print(frontbyrear)

"lapply"
"Petrol price adjusted to 20% inflation"
new_petrol_price <- lapply(Seatbelts[, 6], function(x) 0.2*x)
print(new_petrol_price)

"Converting distance to miles"
dist_miles <- lapply(Seatbelts[, 5], function(x) 0.621371*x)
print(dist_miles)

"sapply"
"Adjusting 5% error in distance covered"
sapply(Seatbelts[, 5], function(x) 0.95*x)