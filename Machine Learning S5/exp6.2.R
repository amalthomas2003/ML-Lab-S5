#Decision Tree Classification 

#use titanic dataset provided in this repository to work properly

library(rpart)
library(rpart.plot)

titanic=read.csv("C:\\Users\\amalt\\OneDrive\\Desktop\\R\\titanic.csv")


#preprocessing 1: Splitting into training and testing data

split_index<-createDataPartition(titanic$Survived ,p=0.8,list=FALSE)
training_data<-titanic[split_index,]
testing_data<-titanic[-split_index,]

#create a tree model from training data to predict if a person survived or not
#"class" Classification problem. Therefore the probability values  associated with
#a person survived or not will be rounded to either 0 or 1

tree_model<-rpart(Survived~.,data=training_data,method="class") 
tree_model #print the tree model in terminal
prp(tree_model) #plot the tree model in plots gui

#Make predictions (whether a person survived or not) on testing data
predictions<-predict(tree_model,newdata = testing_data,type="class")
predictions #to view the probability of predictions


#factor the survived prediction and actual value
testing_data$Survived<-as.factor(testing_data$Survived)
predictions<-as.factor(predictions)

#print the factored valules
predictions
testing_data$Survived

#pring confusion matrix
confusionMatrix(predictions,testing_data$Survived)