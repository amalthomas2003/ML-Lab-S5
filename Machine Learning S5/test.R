
library(caret)
library(class)
library(e1071)

set.seed(123)
#since 5 th columnn is Species We need not standardize(centering+scaling) it
#standardize all columns from 1-4
preproc <- preProcess(iris[, -5], method = c("center", "scale"))

iris[, -5] <- predict(preproc, iris[, -5])

split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)

training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

#knn requires training data to be omitted of species because the Species could interfere the prediction
#i.e)target variable needs to be omitted from training and testing data
#the cl(class label) is the target variable to be predicted

classifier_knn <- knn(train = training_data[, -5], test = testing_data[, -5], cl = training_data$Species, k = 3)

#misclassificationerror is the mean of species that were predicted wrongly by the knn model(classifier_knn)
misClassError <- mean(classifier_knn != testing_data$Species) 

#accuracy=1-misclassificationerror
print(paste('Accuracy =', 1 - misClassError)) 

confusionMatrix(testing_data$Species,classifier_knn)