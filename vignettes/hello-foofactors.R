## ------------------------------------------------------------------------
library(foofactors)
library(gapminder)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))

## ------------------------------------------------------------------------
c(a, b)

## ------------------------------------------------------------------------
fbind(a, b)

## ------------------------------------------------------------------------
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
as.data.frame(table(x))

## ------------------------------------------------------------------------
freq_out(x)

## ------------------------------------------------------------------------
a <- factor(c("a","b","c")) ##Should be character
b <- factor(c("a","b","b")) ##Should be factor

detect_factors(a)
detect_factors(b)

## ------------------------------------------------------------------------
check_factors(iris)
check_factors(gapminder)

## ------------------------------------------------------------------------
a <- factor(c("a","b","c"))
b <- factor(c("apple","banana","pear"))

levels(a)
levels(new_reorder(a))
levels(b)
levels(new_reorder(b))


## ------------------------------------------------------------------------
a <- factor(c("c","b","a"))
b <- factor(c("banana","apple","pear"))
levels(a)
new_factor(a)
levels(b)
new_factor(b)

## ------------------------------------------------------------------------
new_factor_rev(a)
new_factor_rev(b)

