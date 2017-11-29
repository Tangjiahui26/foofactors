# Foofactors
Edited by Jiahui Tang, created by Jenny Bryan  

This file works based on Jenny Bryan's coding, and I added some functions after it.

Factors are a very useful type of variable in R, but they can also drive you nuts. Especially the "stealth factor" that you think of as character.

Can we soften some of their sharp edges?

Binding two factors via `fbind()`:


```r
library(foofactors)
library(gapminder)
```

```
## Warning: package 'gapminder' was built under R version 3.4.2
```

```r
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.


```r
c(a, b)
```

```
## [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.


```r
fbind(a, b)
```

```
## [1] character hits      your      eyeballs  but       integer   where it 
## [8] counts   
## Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work.  Processing with `as.data.frame()` can be helpful but it's a bit clunky.


```r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
```

```
## x
##  a  b  c  d  e 
## 25 26 17 17 15
```

```r
as.data.frame(table(x))
```

```
##   x Freq
## 1 a   25
## 2 b   26
## 3 c   17
## 4 d   17
## 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:


```r
freq_out(x)
```

```
## # A tibble: 5 x 2
##        x     n
##   <fctr> <int>
## 1      a    25
## 2      b    26
## 3      c    17
## 4      d    17
## 5      e    15
```

Above codes are based on Jenny's notes. Here I created more functions about dealing with factor.

Most of time we often want to figure out if the factors should be character. We can use `detect_factors()` to check if some of the element of the factor are not unique. Otherwise, if all of the elements are unique, you probably should use it as character.


```r
a <- factor(c("a","b","c")) ##Should be character
b <- factor(c("a","b","b")) ##Should be factor

detect_factors(a)
```

```
## [1] FALSE
```

```r
detect_factors(b)
```

```
## [1] TRUE
```

We often want to know if our dataframe contains any factors that we don't want to use. The function `check_factors()` can be applied to check it.


```r
check_factors(iris)
```

```
## [1] "Species"
```

```r
check_factors(gapminder)
```

```
## [1] "country"   "continent"
```

Sometimes we may want to change the order of factors, and instead order them in descending way. The function`new_reorder()`can help you to realize it.


```r
a <- factor(c("a","b","c"))
b <- factor(c("apple","banana","pear"))

levels(a)
```

```
## [1] "a" "b" "c"
```

```r
levels(new_reorder(a))
```

```
## [1] "c" "b" "a"
```

```r
levels(b)
```

```
## [1] "apple"  "banana" "pear"
```

```r
levels(new_reorder(b))
```

```
## [1] "pear"   "banana" "apple"
```

If you want to order your factors as the way they appear in the data. The function `new_factor()` would like to set your factors to the order in which they appear in the data. In contrast, If you want the reverse order,`new_factor_rev()` can be used in your codes.


```r
a <- factor(c("c","b","a"))
b <- factor(c("banana","apple","pear"))
levels(a)
```

```
## [1] "a" "b" "c"
```

```r
new_factor(a)
```

```
## [1] c b a
## Levels: c b a
```

```r
levels(b)
```

```
## [1] "apple"  "banana" "pear"
```

```r
new_factor(b)
```

```
## [1] banana apple  pear  
## Levels: banana apple pear
```

Examples for`new_factor_rev()`:


```r
new_factor_rev(a)
```

```
## [1] c b a
## Levels: a b c
```

```r
new_factor_rev(b)
```

```
## [1] banana apple  pear  
## Levels: pear apple banana
```

