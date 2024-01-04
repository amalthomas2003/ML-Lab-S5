library(e1071)
library(caret)

data(iris)

# Split the data into training and testing sets
set.seed(123)
split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

# Train an SVM model whose boundary is defined by a radial function
#use linear, sigmoid,polynomial if needed

svm_model <- svm(Species ~ ., data = training_data, kernel = "radial")

# Make predictions on the testing data
predictions <- predict(svm_model, newdata = testing_data)

# Convert predictions and actual values to factors
predictions <- as.factor(predictions)
actual_values <- as.factor(testing_data$Species)

# Create confusion matrix
confusionMatrix(predictions, actual_values)
