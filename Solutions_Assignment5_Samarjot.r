"Samarjot Singh        Assignment 5"

# Q1
"Reading the dataset"
dsg <- read.csv(file = "./daily_show_guests.csv")

"First 10 records of dataset are"
head(dsg, 10)


# Q2
"Column names in dataset are:"
colnames(dsg)

"Renaming column names without dplyr"
colnames(dsg) <- c("Year", "Job", "Date", "Category", "Guest_Name")

"Renaming column names with dplyr"
library(dplyr)
dsg <- rename(dsg, c(Year = YEAR, Job = GoogleKnowlege_Occupation , Date = Show, Category = Group, Guest_Name = Raw_Guest_List))


# Q3
"Creating report having Year, Date, and Guest_Name columns without dplyr"
dsg1 <- dsg[c("Year", "Date", "Guest_Name")]
head(dsg1)

"Creating report having Year, Date, and Guest_Name columns with dplyr"
dsg2 <- select(dsg, Year, Date, Guest_Name)
head(dsg2)


# Q4
"Creating report without the Year column without dplyr"
dsg3 <- dsg[colnames(dsg) != "Year"]
head(dsg3)

"Creating report without the Year column with dplyr"
dsg4 <- select(dsg, -c(Year))
head(dsg4)


# Q5
"The list of peoples who are 'actor' only name is 'Adam Sandler'"
dsg5 <- filter(dsg, Job == "actor" & Guest_Name == "Adam Sandler")


# Q6
"The records arranged in order of date are:"
dsg6 <- dsg[order(as.Date(dsg$Date, format="%m/%d/%Y")),]
head(dsg6,20)


# Q7
"Adding new column in dataset with experience of person in days without dplyr"
dsg$Experience <- difftime(as.Date(Sys.Date(), format="%m/%d/%Y"), as.Date(dsg$Date, format="%m/%d/%Y"), units="days")

"Adding new column in dataset with experience of person in days with dplyr"
dsg <- mutate(dsg, Experience = difftime(as.Date(Sys.Date(), format="%m/%d/%Y"), as.Date(dsg$Date, format="%m/%d/%Y"), units="days"))