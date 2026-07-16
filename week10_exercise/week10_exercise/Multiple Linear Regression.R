# ==========================================
# Question 2: Multiple Linear Regression
# ==========================================

# 1. Create the dataset based on the provided table
ozone <- c(11, 11, 11, 12, 12, 13, 13, 13, 13, 14)
solar_r <- c(290, 44, 320, 149, 120, 137, 112, 27, 238, 274)
wind <- c(9.2, 9.7, 16.6, 12.6, 11.5, 10.3, 11.5, 10.3, 12.6, 10.9)
temp <- c(66, 62, 73, 74, 73, 76, 71, 76, 64, 68)

df_ozone <- data.frame(Ozone = ozone, Solar.R = solar_r, Wind = wind, Temp = temp)

# 2. Split the dataset (70% training, 30% testing) 
set.seed(456) # Set random seed for reproducibility
sample_size_2 <- floor(0.7 * nrow(df_ozone))
train_indices_2 <- sample(seq_len(nrow(df_ozone)), size = sample_size_2)

train_data_2 <- df_ozone[train_indices_2, ]
test_data_2 <- df_ozone[-train_indices_2, ]

cat("\n--- Question 2: Multiple Linear Regression Model Results ---\n")

# 3. Build the multiple linear regression model (using 70% training data) 
# Target: Ozone, Predictors: Solar.R + Wind + Temp 
model_2 <- lm(Ozone ~ Solar.R + Wind + Temp, data = train_data_2)

# Output the model summary statistics (includes coefficients and significance)
print(summary(model_2))

# 4. Perform predictions on the testing set 
predictions_2 <- predict(model_2, newdata = test_data_2)
cat("Testing set prediction results:\n")
print(data.frame(Actual = test_data_2$Ozone, Predicted = predictions_2))

