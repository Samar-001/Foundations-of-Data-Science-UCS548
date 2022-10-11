"Samarjot Singh        Assignment 3.1"

# Q1
A <- array(c(12:16))
A


# Q2
cat("  The sum of all elements of A array is:", sum(A))


# Q3
cat("  The product of all elements of A array is:", prod(A))


# Q4
cat("  Minimum element of A array is:", min(A))
cat("  Maximum element of A array is:", max(A))


# Q5
cat("  Elements of A array range from", range(A)[1], "to", range(A)[2])


# Q6
cat("  Mean of elements of A array is:", mean(A))
cat("  Variance of elements of A array is:", var(A))
cat("  Standard Deviation of elements of A array is:", sd(A))
cat("  Median of elements of A array is:", median(A))


# Q7
B <- sort(A)
C <- sort(A, decreasing=TRUE)


# Q8
D <- matrix(c(1:12), 3, 4)
D


# Q9
RW <- matrix(c(A,B,C), 3, byrow = TRUE)
CW <- matrix(c(A,B,C), 3)
RW
CW


# Q10
cat("  1st row elements of RW matrix are:", RW[2, ], "and the 3rd row elements are:", RW[3, ])


# Q11
cat("  1st column elements of CW matrix are:", CW[1, ], "and the 3rd column elements are:", CW[4, ])


# Q12
cat("  2nd row and 3rd column element of RW matrix is:", RW[2, 3])
cat("  2nd row and 4th column element of CW matrix is:", CW[2, 4])