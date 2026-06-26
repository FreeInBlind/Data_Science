#1.Dataframe & Accessing Data

names = c("Carrol", "Mike", "John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)

df = data.frame(names, gender, height, weight, age)
View(df)

df[1]      # display 1st col
df[1,]     # display 1st row
df[1:2]    # display 1st and 2nd col
df[1:2,]   # display 1st and 2nd row

# Accessing the "Gender" column using square brackets
df1 <- df['gender'] # Returns a data frame
print(df1) # Display the data frame

# Accessing the "gender" column using the $ operator
df2 <- df$gender # Returns a vector
print(df2) # Display the vector


#2.Accessing Data With Condition

df[df$names == 'Mike', ]
df[df$age > 35, ]
df[df$height > 170 & df$weight > 80, ]

df[df$gender == 'Male', ]
df[df$height > 170 & df$age < 40, ]


#3.Adding New Data

names = c("Carrol", "Mike", "John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)

df = data.frame(names, gender, height, weight, age)
print("Before Adding:\n")
print(df)

newdf = rbind(df, data.frame(
  names = "Suuria",
  gender = "Female",
  height = 156,
  weight = 56,
  age = 23
))
print("After Added rows:\n")
print(newdf)


#4.Merging Dataframes

names = c("Carrol", "Mike", "John", "Suuria", "Malik")
gender = c("Female", "Male", "Male", "Female", "Male")
height = c(160, 175, 173, 156, 169)
weight = c(49, 89, 77, 56, 81)
age = c(35, 36, 41, 23, 28)
df1 = data.frame(names, gender, height, weight, age)

names = c("Carrol", "John", "Malik")
states = c("Selangor", "Perak", "Melaka")
df2 = data.frame(names, states)

# 合并操作
dfMerge = merge(df1, df2, by = "names", all = TRUE)


#5.More Manipulations

newDf2 = newDf[-2, ]
newDf3 = newDf
newDf3[1, "age"] <- 30
newDf3[4, "height"] <- 152

########################################################################

#1.Importing Dataset
library(readr)

data_cov = read.csv("C:\Users\jm166\Desktop\数据科学\week7_exercise\my_covid.csv")

# head() function can be used to display the first n of the dataset
head(data_cov, 5)

# summary() function displays the summary of each column in the dataset e.g., min, max, median values etc.
summary(data_cov)


#2.Exporting Dataset
names = c("Carrol", "Mike", "John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
savedf = data.frame(names, gender, height, weight, age)

write.csv(savedf, "C:\Users\jm166\Desktop\数据科学\week7_exercise\my_covid_exported.csv")


#3.Effect of Missing Values

# creating a vector of integers having NAs.
a <- c(1:5, rep(NA, 3), 6:10)
a

# performing sum on the vector
sum(a)

# selecting only integer values
b <- a[!is.na(a)]
b

# performing sum on the new vector
sum(b)


#4.Handling Missing Values

# creating a vector of integers having NAs.
a <- c(seq(1, 10, 3), rep(NA, 4), seq(10, 2, -2))
a

# assigning 0 to NAs
a[is.na(a)] <- 0
a


#5.Importing external dataset

df <- read.csv("C:\Users\jm166\Desktop\数据科学\week7_exercise\NAexample.csv")

# 检查整个数据框
is.na(df) 

# 或者只检查某一列
is.na(df["VarA"])

mean(df$VarA)

mean(na.omit(df$VarA))