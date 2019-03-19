# geomsort
An ggplot2 extension for sorting data points to reduce overplotting. Data points are sorted with their y-coordinates, and horizontal variations are added to their locations to enhance visibility.
![Alt text](example/example.png)
The motivation of this package is to facilitate drawing figures like Fig. 1 of the following paper.

Lawrence et al., Mutational heterogeneity in cancer and the search for new cancer-associated genes. *Nature* 499, 214–218 (2013) [doi:10.1038/nature12213] (https://dx.doi.org/10.1038/nature12213)

## Installation
```
install.packages("devtools")  
devtools::install_github("msfuji/geomsort")
````

## Usage
```
ggplot(iris, aes(x=Species, y=Sepal.Length)) + geom_sort()
```