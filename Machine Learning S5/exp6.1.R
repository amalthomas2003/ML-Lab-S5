#Naive  Bayes Classification

library(e1071)
library(caret)

soybean<-read.csv("C:\\Users\\amalt\\OneDrive\\Desktop\\R\\Soybean.csv")

#preporcessing 1: removing missing values
sum(is.na(soybean))
soybean<-na.omit(soybean)

#preprocessing 2: Centering
#preprocessing 3: Scaling

preproc<-preProcess(soybean[,-1],method=c("center","scale"))
soybean[,-1]<-predict(preproc,soybean[,-1])

#preprocessing 4: Splitting into training and testing data

split_index<-createDataPartition(soybean$Class,p=0.8,list=FALSE)
training_data<-soybean[split_index,]
testing_data<-soybean[-split_index,]

#create a model to predict the "Class" of each testing data
naive_bayes_model<-naiveBayes(Class~.,data=training_data)

#use the model to predict on testing data
predictions<-predict(naive_bayes_model,newdata=testing_data)

#the predicted and training_data Class will be in different format
#eg one might be list of  string and  other might be vector
#to create confusion matrix (predicted class vs actual class)we need to make their type same
#use as.factor() to make the predictions into same data type "factor"
predictions<-as.factor(predictions)
predictions #print predictions

testing_data$Class<-as.factor(testing_data$Class)
soybean$Class #print actual values of class from testing data

#create confusion matrix of predicted class vs actual class
confusionMatrix(predictions,testing_data$Class)
