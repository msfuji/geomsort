library(ggplot2)
library(geomsort)

n=100
n3=as.integer(n*0.3)
col=c(rep("A",n3), rep("B", n-n3))
df=data.frame(x=rep(c("X","Y","Z"), each=n),
              y=rnorm(3*n, mean=rep(c(-2, 0, 2), each=n)),
              c=rep(col,3))

p=ggplot(df, aes(x=x, y=y, colour=c)) + geom_sort(width=0.5, size=0.1)
p=p + theme_grey(base_size = 7) + xlab(NULL) + ylab("Value")


#plot(p, scale=0.3)
ggsave(file="example2.png", plot=p, scale=0.3)
