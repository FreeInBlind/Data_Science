# 1. Data Preparation
# data of height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 
# data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)           

# Apply the lm() function for basic model
relation_basic <- lm(y ~ x)
print(relation_basic)

# Plot the chart
plot(x, y, col = "blue", main = "Height & Weight Regression",
     pch = 16, xlab = "Height in cm", ylab = "Weight in Kg")
abline(lm(y ~ x))

# ---------------------------------------------------------
# 2. Splitting data into training and testing
# Creating data frame
data1 <- data.frame(x, y)

# Splitting data into training and testing 
data1_train <- data1[1:7, ]
data1_test <- data1[8:10, ]

# Apply the lm() function on training data
relation <- lm(y ~ x, data = data1_train)
print(relation)

# ---------------------------------------------------------
# 3. Make prediction
x_test <- data.frame(x = data1_test$x)
result <- predict(relation, x_test)
print(result)

# Find weight of a person with height 170
x_specific <- data.frame(x = 170)
result_specific <- predict(relation, x_specific)
print(round(result_specific, digits = 2))

# ---------------------------------------------------------
# 4. Performance measurement
# Option 1: MAPE Calculation
mape <- mean(abs((data1_test$y - result) / data1_test$y) * 100)
paste("The error MAPE is: ", round(mape, digits = 2), "%")

# Option 2: Create a data frame to combine the actuals and predicted values
actuals_preds <- data.frame(cbind(actuals = data1_test$y, predicteds = result)) 
mape_2 <- mean(abs((actuals_preds$actuals - actuals_preds$predicteds) / actuals_preds$actuals) * 100)
paste("The error MAPE is: ", round(mape_2, digits = 2), "%")

