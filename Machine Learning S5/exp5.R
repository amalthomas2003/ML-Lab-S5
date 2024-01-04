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


head(training_data) #print first few columns of training data
head(testing_data)  #print first few columns of training data
nrow(training_data) #print number of rows of training data
nrow(test_data)     #print number of rows of testing data
