# ==========================================
# Question 1: Simple Linear Regression
# ==========================================

# 1. Create the dataset based on the provided table
experience <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
salary <- c(2500, 2700, 3000, 3400, 3900, 4400, 5000, 5600, 6200, 6900)
df_salary <- data.frame(Experience = experience, Salary = salary)

# 2. Split the dataset (70% training, 30% testing) 
set.seed(123) # Set random seed for reproducibility
sample_size_1 <- floor(0.7 * nrow(df_salary))
train_indices_1 <- sample(seq_len(nrow(df_salary)), size = sample_size_1)

train_data_1 <- df_salary[train_indices_1, ]
test_data_1 <- df_salary[-train_indices_1, ]

cat("--- Question 1: Simple Linear Regression Model Results ---\n")

# 3. Build the simple linear regression model (using 70% training data) 
# Target: Salary, Predictor: Experience 
model_1 <- lm(Salary ~ Experience, data = train_data_1)

# Output the model summary statistics
print(summary(model_1))

# 4. Perform predictions on the testing set (for model validation) 
predictions_1 <- predict(model_1, newdata = test_data_1)
cat("Testing set prediction results:\n")
print(data.frame(Actual = test_data_1$Salary, Predicted = predictions_1))

# 5. Visualize the output (scatter plot with regression line) 
# Plot scatter plot for the full dataset 
plot(df_salary$Experience, df_salary$Salary,
     main = "Simple Linear Regression: Salary vs Experience",
     xlab = "Years of Experience",
     ylab = "Monthly Salary (RM)",
     pch = 16,        # Point shape (solid circle)
     col = "blue")    # Point color

# Overlay the regression line fitted on the training set 
abline(model_1, col = "red", lwd = 2) # lwd=2 increases line width
