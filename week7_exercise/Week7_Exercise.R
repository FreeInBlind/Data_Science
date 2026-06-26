# 1.Creating DataFrame

# 创建每一列的向量(Create vectors for each column)
Name <- c("Aisha", "Bryan", "Chloe", "Daniel", "Emily")
Gender <- c("Female", "Male", "Female", "Male", "Female")
Age <- c(22, 23, 21, 24, 22)
Test_Score <- c(85, 78, 92, 65, 88)
Attendance <- c(90, 85, 95, 70, 88)

# 合并为数据框(Combine into a data frame)
students <- data.frame(Name, Gender, Age, Test_Score, Attendance)

# 查看数据框(View the data frame)
View(students) 

###################################################################

# 2.Access and Subset Data

# 使用两种不同的方式显示 Test_Score 列(#Display the Test_Score column using both df['Test_Score'] and df$Test_score.)
students['Test_Score']
students$Test_Score

# 显示数据框的前 3 行(Display the first 3 rows of the data frame)
head(students, 3) 
# 或者也可以写成：students[1:3, ]

# 显示年龄大于 22 岁的学生(Display students who are older than 22)
students[students$Age > 22, ]

# 显示成绩大于 80 的女学生(Display female students with Test_Score greater than 80)
students[students$Gender == "Female" & students$Test_Score > 80, ]

###################################################################

# 3.Add New Data

# 创建包含新学生信息的数据框(Create a data frame with new student information)
new_student <- data.frame(
  Name = "Lina", 
  Gender = "Male", 
  Age = 20, 
  Test_Score = 95, 
  Attendance = 92
)

# 使用 rbind() 将新行合并到现有数据框中(Use rbind() to merge the new rows into the existing data frame)
students <- rbind(students, new_student)

# 打印查看结果(print result)
print(students)

###################################################################

# 4.Handling Missing Values

# 给定的包含 NA 的数据框
students_na <- data.frame(
  Name = c("Aisha", "Bryan", "Chloe", "Daniel", "Emily"),
  Gender = c("Female", "Male", "Female", "Male", "Female"),
  Age = c(22, NA, 21, 24, 22),
  Test_Score = c(85, 78, NA, 65, 88),
  Attendance = c(90, 85, 95, NA, 88)
)

# 1. 检查数据框中的缺失值 (NA)(Check for missing values (NA) in the data frame)
is.na(students_na)

# 2. 将 Age 列中的缺失值替换为该列的平均年龄 (mean)(Replace missing values in Age with the mean age)
students_na$Age[is.na(students_na$Age)] <- mean(students_na$Age, na.rm = TRUE)

# 3. 将 Test_Score 列中的缺失值替换为该列的中位数 (median)(Replace missing values in Test_Score with the median test score)
students_na$Test_Score[is.na(students_na$Test_Score)] <- median(students_na$Test_Score, na.rm = TRUE)

# 4. 将 Attendance 列中的缺失值替换为 0(Replace missing values in Attendance with 0)
students_na$Attendance[is.na(students_na$Attendance)] <- 0

# 打印最终清理好的数据框(print result)
print(students_na)

