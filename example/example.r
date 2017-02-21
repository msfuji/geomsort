library(ggplot2)
library(geomsort)

n=100
n3=as.integer(n*0.3)
col=c(rep("A",n3), rep("B", n-n3))
df=data.frame(x=rep(c("X","Y","Z"), each=n),
              y=rnorm(3*n, mean=rep(c(-2, 0, 2), each=n), sd=2),
              c=rep(col,3))

p=ggplot(df, aes(x=x, y=y, colour=c)) + geom_sort(width=.75, size=0.2)
p=p + theme_grey(base_size = 7) + xlab(NULL)


plot(p)
ggsave(file="example.png", plot=p, scale=0.3)
