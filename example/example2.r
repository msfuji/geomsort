library(ggplot2)
library(geomsort)

p <- ggplot(iris, aes(x=Species, y=Sepal.Length, color=Sepal.Width > 3)) + 
  geom_sort(size=1) +
  theme_grey(base_size = 8) + 
  xlab(NULL)

ggsave(file="example/example2.png", width=4, height=2)
