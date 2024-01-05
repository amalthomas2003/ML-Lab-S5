########################################    bagging

library(ipred)
library(caret)

set.seed(123)

#preprocessing : 1
split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

# Train the bagged model
bagged_model <- bagging(Species ~ ., data = training_data, nbagg = 50)

# Make predictions on the testing data
predictions <- predict(bagged_model, newdata = testing_data)

# Evaluate accuracy using confusion matrix
confusionMatrix(predictions, testing_data$Species)
 
 
 ################################      boosting
library(gbm)
library(caret)

data(iris)
set.seed(123)

split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]


#Creating gbm module using minimum parameters
#Use ans <- gbm(Species ~ ., data = training_data, distribution = "multinomial", n.trees = 100, interaction.depth = 3, shrinkage = 0.1)
#for more control  over the model
ans <- gbm(Species ~ ., data = training_data)
p <- predict(ans, newdata = testing_data)

#p will give probabilities of testing data being in each class
#the column names will the the class labels
#apply these class labels to the testing data instance which has the  maximum probability


class_predictions <- colnames(p)[apply(p, 1, which.max)]


testing_data$Species <- as.factor(testing_data$Species)
class_predictions <- as.factor(class_predictions)
 
confusion_matrix <- confusionMatrix(class_predictions, testing_data$Species)
confusion_matrix
