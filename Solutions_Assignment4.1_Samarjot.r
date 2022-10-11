"Samarjot Singh        Assignment 4.1"

# Q1
patients_df <- data.frame(PatientID = c(1, 2, 3, 4),
                          AdmDate = c("10/15/2009", "11/01/2009", "10/21/2009", "10/28/2009"),
                          Age = c(25, 34, 28, 52),
                          Diabetes = c("Type1", "Type2", "Type1", "Type1"),
                          Status = c("Poor", "Improved", "Excellent", "Poor"))
patients_df


# Q2
# (a)
data.frame(patients_df$PatientID, patients_df$Age)

# (b)
"The Type1 diabetes patients are:"
patients_df[patients_df$Diabetes == "Type1", ]

# (c)
cat("  The number of patients of poor status are:", nrow(patients_df[patients_df$Status == "Poor", ]))

# (d)
"Summary of patients dataframe is as follows:"
summary(patients_df)

# (e)
cat("  Average age of patients having diabetes is:", mean(as.numeric(patients_df$Age)))

# (f)
patients_df[nrow(patients_df) + 1, ] = c(nrow(patients_df) + 1, "12/09/2009", 47, "Type2", "Excellent")
patients_df[nrow(patients_df) + 1, ] = c(nrow(patients_df) + 1, "08/12/2009", 40, "Type2", "Improved")


# Q3
MyFirstList <- list(a = c(12, 14, 16, 20),
           m = matrix(c(1:20), nrow = 5),
           s = c('First', 'Second', 'Third'))

"MyFirstList is as follows:"
MyFirstList

"Structure of MyFirstList is:"
str(MyFirstList)

"The age vector a is as follows:"
MyFirstList$a