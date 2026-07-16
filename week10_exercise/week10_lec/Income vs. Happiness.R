# Read data (Ensure the path and file exist in your environment)
df <- read.csv("C:/Users/jm166/Desktop/数据科学/week10_exercise/income_happiness.csv")

# Split data into training (80%) and testing (20%) sets
# Randomly select row indices for training
train_indices <- sample(1:nrow(df), size = 0.8 * nrow(df))
train_data <- df[train_indices, ]
test_data <- df[-train_indices, ]

# Apply the lm() function
relation <- lm(happiness ~ income, data = train_data)
print(relation)

# Prediction
a <- data.frame(income = test_data$income)
result <- predict(relation, a)

# Plot
plot(test_data$income, test_data$happiness, col = "red", pch = 16, 
     xlab = "income", ylab = "happiness")
abline(lm(happiness ~ income, data = train_data))

