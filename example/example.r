library(ggplot2)
library(geomsort)

set.seed(123)

n <- 100
df <- data.frame(x=rep(c("A", "B", "C", "D", "E", "F"), each=n),
                 y=rnorm(6*n, mean=rep(c(0:5), each=n)))

p <- ggplot() +
  geom_tile(data=data.frame(x=unique(df$x)),
            aes(x=x, y=0, width=1, height=Inf, fill=as.character(as.numeric(x) %% 2)), alpha=0.2) +
  scale_fill_manual(values = c("0"="white", "1"="blue"), guide="none") +
  geom_sort(data=df, aes(x=x, y=y), size=0.1)  +
  stat_summary(data=df, aes(x=as.numeric(x), y=y), fun.y = "median", geom = "point", pch="-", size=7, color="red") +
  theme_classic(base_size = 7) +
  labs(x=NULL, y="Value")

ggsave(file="example/example.png",  width=2.5, height=2)
