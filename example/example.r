library(ggplot2)
library(geomsort)

n=100
df=data.frame(x=rep(c("X","Y","Z"), each=n),
              y=rnorm(3*n, mean=rep(c(-2, 0, 2), each=n)))

p=ggplot(df, aes(x=x, y=y)) + geom_sort(width=0.5, size=0.1) +
    stat_summary(fun.y = "median", geom = "crossbar", color="red",
                 mapping = aes(ymin = ..y.., ymax = ..y..), size=0.1, width=0.3)
p=p + theme_grey(base_size = 7) + xlab(NULL) + ylab("Value")


#plot(p, scale=0.3)
ggsave(file="example.png", plot=p, scale=0.3)
