library(geomsort)
library(ggplot2)

n=300
df=data.frame(y=c(rnorm(n,1), rnorm(n,2), rnorm(n,3)),
              x=rep(c("hoge","huga","moge"), each=100),
              c=rep(c(rep("A",30), rep("B", 30), rep("C", 40)), 3))

p=ggplot(df, aes(x=x, y=y, colour=c))+
  #geom_point(position=position_sort(width=0.5))
  #geom_point(position=position_sort())
  geom_sort(width=.75)
#plot(p)
ggsave(file="example.png")
