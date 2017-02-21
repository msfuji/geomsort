library(ggplot2)
library(geomsort)

n=300
col=c(rep("A",n*0.3), rep("B", n-(n*0.3)))
df=data.frame(x=rep(c("X","Y","Z"), each=n),
              y=rnorm(3*n, mean=rep(c(-2, 0, 2), each=n), 4),
              c=rep(col,3))

print(df)
p=ggplot(df, aes(x=x, y=y, colour=c))+
  geom_point(position=position_sort(width=0.5))
  #geom_point(position=position_sort())
#  geom_sort(width=.75)
plot(p)
#ggsave(file="example.png")
