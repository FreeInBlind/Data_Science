# 1. Load built-in data
data(mtcars)
head(mtcars)
str(mtcars)

# Model the MLR using the full dataset
model <- lm(mpg ~ hp + wt + cyl, data = mtcars)

# Investigate the properties of the model
summary(model)

# ---------------------------------------------------------
# 2. Split data into train and test sets
data.train <- mtcars[1:22, ]
data.test <- mtcars[23:32, ]

# Modelling
relation_multi <- lm(mpg ~ hp + wt + cyl, data = data.train)
summary(relation_multi)

# ---------------------------------------------------------
# 3. Prediction and Performance Measurement
# Prediction
a <- data.frame(hp = data.test$hp, wt = data.test$wt, cyl = data.test$cyl)
result_multi <- predict(relation_multi, a)
print(round(result_multi, digits = 2))

# Performance measurement: Mean Absolute Percentage Error (MAPE)
mape_multi <- mean(abs((data.test$mpg - result_multi) / data.test$mpg) * 100)
paste("The error MAPE is: ", round(mape_multi, digits = 2), "%")

# Performance measurement: Correlation accuracy
actuals_preds_multi <- data.frame(cbind(actuals = data.test$mpg, predicted = result_multi))
correlation_accuracy <- cor(actuals_preds_multi)
print(correlation_accuracy)
