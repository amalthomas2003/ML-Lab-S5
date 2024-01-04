library(ggplot2)
ggplot(iris,aes(x=Petal.Length,y=Petal.Width,color=factor(Species),shape=factor(Species)))+
  geom_point()+
  labs(title="Scatter Plot of Petal Length VS. Petal Width"
       ,x="Petal Length",y="Petal Width")
print(iris)