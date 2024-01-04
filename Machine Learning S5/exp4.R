library(ggplot2)
titanic=read.csv("C:\\Users\\amalt\\OneDrive\\Desktop\\R\\titanic.csv")
titanic<-na.omit(titanic)
histogram <- ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 10,fill = "black",color = "green")+
  labs(title = "Histogram of Age information",
       x = "Age",
       y = "Frequency")
print(histogram)