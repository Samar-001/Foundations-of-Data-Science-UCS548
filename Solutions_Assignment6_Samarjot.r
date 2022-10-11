"Samarjot Singh        Assignment 6"


library(dplyr)

# Q1
"Reading the Country dataset"
dsg <- read.csv(file = "./CountryDataset.csv")
"First 10 records of Country dataset are"
head(dsg, 10)

# Q1.1
"Number of countries in each continent are:"
dsg_grp_continent <- dsg %>% group_by(Continent) %>% summarise(No_of_countries = length(unique(Country)))
print(dsg_grp_continent)

# Q1.2
"Europen country with lowest GDP"
dsg_eur_gdp <- dsg %>% group_by(Continent, Year) %>% summarise(Country, Min_GDP = min(gdpPerc)) %>% filter(Continent == 'Europe')
print(dsg_eur_gdp, n=100)

# Q1.3
"Avg life expectancy by each continent"
dsg_continent_le <- dsg %>% group_by(Continent, Year) %>% summarise(Avg_Life_Expectancy = mean(LifeExp))
print(dsg_continent_le, n=120)

# Q1.4
"Creating report having Year, Date, and Guest_Name columns without dplyr"
dsg_highest_GDP <- dsg %>% mutate(GDP = gdpPerc*Pop) %>% group_by(Country) %>% summarise(Total_GDP = sum(GDP)) %>% arrange(desc(Total_GDP)) %>% head(5)
print(dsg_highest_GDP)

# Q1.5
"Countries and years having life expectancies of at least 80 years"
dsg_le_eighty <- dsg %>% filter(LifeExp >= 80)
print(dsg_le_eighty)

# Q1.6
"10 countries have the strongest correlation (in either direction) between life expectancy and per capita GDP"
dsg_strong_corr <- dsg %>% group_by(Country) %>% summarise(Correlation = abs(cor(gdpPerc, LifeExp))) %>% arrange(desc(Correlation)) %>% head(10)
print(dsg_strong_corr)

# Q1.7
"Combinations of continent (besides Asia) and year have the highest average population across all countries"
dsg_avg_pop <- dsg %>% filter(Continent != "Asia") %>% group_by(Continent, Year) %>% summarise(Avg_Population = mean(Pop)) %>% arrange(desc(Avg_Population))
print(dsg_avg_pop, n=100)

# Q1.8
"Countries having most consistent population estimates"
dsg_pop_est <- dsg %>% group_by(Country) %>% summarise(SD = sd(Pop)) %>% arrange(SD)
print(dsg_pop_est, n=100)

# Q1.9
"Population of a country has decreased from the previous year and the life expectancy has increased"
dsg_year_le <- dsg %>% arrange(Year) %>% arrange(Country, Year) %>% group_by(Country) %>% filter(Pop < lag(Pop) & LifeExp > lag(LifeExp))
print(dsg_year_le, n=100)


# Q2
"Reading the Medicine dataset"
dsg1 <- read.csv(file = "./MedicineDataset.csv")
"First 5 records of Medicine dataset are"
head(dsg1, 5)

# Q2.2
"First 4 records of the file are:"
head(dsg1, 4)

# Q2.3
"Last 4 records of the file are:"
tail(dsg1, 4)

# Q2.4
"Coorelation between Quantity_in_stock and Exp_date"
cor(dsg1$Quantity_in_stock, as.numeric(as.POSIXct(dsg1$Exp_date, format="%m/%d/%Y")))

# Q2.5
"Bar graph for the Sales with year of manufacturing"
dsg1_5 <- dsg1 %>% group_by(Manf_year) %>% summarise(Tot_sales = sum(Sales))
barplot(dsg1_5$Tot_sales, names.arg = dsg1_5$Manf_year, xlab = "Manufacturing Year", ylab = "Sales", main = "Mfg year vs Sales")

# Q2.6
"Company having more than one type of medicine"
dsg1_grp_company <- dsg1 %>% group_by(Company) %>% summarise(No_of_medicines = length(unique(Med_Name))) %>% filter(No_of_medicines>1)
print(dsg1_grp_company)

# Q2.7
"Type of different medicines available are"
unique(dsg1$Med_Name)
"Number of different medicines available are"
length(unique(dsg1$Med_Name))

# Q2.8
"Box plot between MedID and Weeks to expire"
dsg1_8 <- dsg1 %>% mutate(Exp_weeks = difftime(Exp_date, Sys.Date(), units="weeks"))
dsg1_8 <- dsg1_8 %>% mutate(Exp_months = as.numeric(gsub("([0-9]+).*$", "\\1", dsg1_8$Exp_weeks))/4)
print(dsg1_8)
boxplot(Exp_months ~ MedID, data = dsg1_8, xlab = "Medicine ID", ylab = "Number of weeks to expiry", main = "Medicine expiry")

# Q2.9
"Average stock in the store is:"
mean(dsg1$Quantity_in_stock)

# Q2.10
"Regression model between Manufacturing year and Sales"
relation <- lm(dsg1$Sales~dsg1$Manf_year)
summary(relation)
plot(dsg1$Manf_year, dsg1$Sales, main="Sales vs Mfg year Regression", xlab="Mfg year", ylab="Sales", col="blue")
abline(relation, lwd=2, col="red")