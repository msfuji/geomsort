library(ggplot2)
library(geomsort)

p <- ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_sort(size=.3, pch=1) +
  stat_summary(fun.y = "median", geom = "crossbar", color="red",
               mapping = aes(ymin = ..y.., ymax = ..y..), size=0.3, width=0.3) +
  theme_grey(base_size = 8) + 
  xlab(NULL)

ggsave(file="example/example.png",  width=2.5, height=2)
