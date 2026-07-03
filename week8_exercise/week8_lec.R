library(dplyr)
library(readr)
student_data<- read.csv("C:/Users/jm166/Desktop/数据科学/week8_exercise/student_data.csv")

# 使用 filter 函数设定筛选条件
Student_fail<- student_data %>% filter(final_exam_mark< 40)
View(Student_fail)

# desc() 用于降序，如果不加则默认升序 (Increasing order)
mydata1 <- student_data %>% filter(final_exam_mark > 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

mydata2 <- student_data %>% filter(final_exam_mark > 40) %>% arrange(final_exam_mark)
View(mydata2)

mydata2 <- student_data %>% select(student_id, coursework_mark, final_exam_mark)
View(mydata2)

mydata4 <- student_data %>% mutate(Total_Mark = (coursework_mark + final_exam_mark/200*100))
View(mydata4)

glimpse(mydata2)

mydata4 = student_data%>% mutate(Total_Mark=(coursework_mark + final_exam_mark/200*100))
View(mydata4)

#_________________________________________________________________________________________________

data(iris)
View(iris)
tail(iris)
str(iris)

min(iris$Sepal.Length) #this produces 4.3
max(iris$Sepal.Length) #this produces 7.9
range(iris$Sepal.Length)
sd(iris$Sepal.Length)
var(iris$Sepal.Length)
mean(iris$Sepal.Length) #this produces 5.843333
median(iris$Sepal.Length) #this produces 5.8
summary(iris)

A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)

nrow(iris)
ncol(data)
sum(is.na(iris$Sepal.Length))
hist(iris$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")
first_q <- quantile(data, 0.25)
third_q <- quantile(data, 0.75)

iqr <- IQR(data)
le <- first_q - 1.5 * iqr
ue <- third_q + 1.5 * iqr
data_new <- data
data_new[data_new < le] <- le
data_new[data_new > ue] <- ue
data_new

data_new<- data
avg <- round(mean(data_new))#for the purpose of example we round up value
data_new[data_new<le] <- avg
data_new[data_new>ue] <- avg
data_new