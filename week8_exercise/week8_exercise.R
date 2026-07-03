library(readr)

# Use read_csv() from the readr package to load the data.
# It automatically reads the data as a 'tibble' (a modern, user-friendly data frame).
student_data <- read_csv("C:/Users/jm166/Desktop/数据科学/week8_exercise/student_data.csv")

# -----------------------------------------------------------------------------
# 1. Show the details of students whose final_exam_mark is greater than 80%.
# -----------------------------------------------------------------------------
# Use subset() to filter the dataframe based on the condition.
high_scorers <- subset(student_data, final_exam_mark > 80)

print("--- 1. Students with final exam mark > 80% ---")
print(high_scorers)


# -----------------------------------------------------------------------------
# 2. Arrange the dataset in ascending order based on course_work_mark.
# -----------------------------------------------------------------------------
# Use order() to get the sorted indices, then apply them to the dataframe rows.
sorted_dataset <- student_data[order(student_data$coursework_mark), ]

print("--- 2. Dataset sorted by course_work_mark (Ascending) ---")
print(sorted_dataset)


# -----------------------------------------------------------------------------
# 3. Display only the student name and final_exam_mark attributes.
# -----------------------------------------------------------------------------
# Extract specific columns by passing a vector of column names.
selected_attributes <- student_data[, c("student_name", "final_exam_mark")]

print("--- 3. Specific attributes (Name and Final Exam Mark) ---")
print(selected_attributes)


# -----------------------------------------------------------------------------
# 4. Specify the number of rows and columns in the dataset.
# -----------------------------------------------------------------------------
# nrow() returns the number of rows, ncol() returns the number of columns.
num_rows <- nrow(student_data)
num_cols <- ncol(student_data)

cat("--- 4. Dimensions of the dataset ---\n")
cat("Number of Rows:", num_rows, "\n")
cat("Number of Columns:", num_cols, "\n\n")


# -----------------------------------------------------------------------------
# 5. Explain how to obtain details and show dataset details.
# -----------------------------------------------------------------------------
# str() shows the structure of the dataset (data types, preview of values).
# Since it's a tibble, you could also just use glimpse(student_data) if you load dplyr.
print("--- 5a. Dataset Structure details using str() ---")
str(student_data)

# summary() provides statistical summaries for each column (min, max, mean, etc.).
print("--- 5b. Dataset Summary details using summary() ---")
summary(student_data)


# -----------------------------------------------------------------------------
# 6. Identify, detect, and demonstrate outliers using R.
# -----------------------------------------------------------------------------
print("--- 6. Outlier Detection for final_exam_mark ---")

# Method A: Visual Detection using Boxplot
# Outliers will appear as isolated points (circles) outside the whiskers.
boxplot(student_data$final_exam_mark, 
        main = "Boxplot of Final Exam Marks", 
        ylab = "Marks", 
        col = "lightgreen", 
        outcol = "red",  # Highlight outliers in red
        pch = 19)        # Use solid circles for outliers

# Method B: Statistical Detection using the Interquartile Range (IQR) method
# Step 1: Calculate 1st Quartile (Q1) and 3rd Quartile (Q3)
Q1 <- quantile(student_data$final_exam_mark, 0.25, na.rm = TRUE)
Q3 <- quantile(student_data$final_exam_mark, 0.75, na.rm = TRUE)

# Step 2: Calculate the Interquartile Range (IQR)
IQR_value <- Q3 - Q1

# Step 3: Define the lower and upper bounds for non-outlier data
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# Step 4: Extract the outliers from the dataset
outliers_data <- subset(student_data, 
                        final_exam_mark < lower_bound | final_exam_mark > upper_bound)

print("Detected Outliers based on 1.5 * IQR rule:")
if (nrow(outliers_data) > 0) {
  print(outliers_data)
} else {
  print("No outliers detected in final_exam_mark.")
}

