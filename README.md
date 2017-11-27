
foofactors
==========

This is the README for the`foofactors`package, which is a toy package created for [STAT547](http://stat545.com/index.html). It is not recommended for general use, so if you want to know more about dealing with`factor`, you can download[`forcats`](https://github.com/tidyverse/forcats)package.

Overview
--------

The`foofactors`package contains 7 functions to help users taking control of factors easier and less annoying.

Installation
------------

``` r
devtools::install_github("Tangjiahui26/foofactors")
```

Usage
-----

### `fbind()`

`fbind()` combines two factors in a way that is more logical than c(a,b). The return value of`fbind()`is also a factor.

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
c(a,b)
#> [1] 1 3 4 2 1 3 4 2
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

### `freq_out()`

Often we want a table of frequencies for the levels of a factor. The base`table()`function returns an object of class table, which can be inconvenient for downstream work. Processing with as.data.frame() can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The`freq_out()`function returns a frequency table as a well-named`tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>        x     n
#>   <fctr> <int>
#> 1      a    25
#> 2      b    26
#> 3      c    17
#> 4      d    17
#> 5      e    15
```

### `detect_factors()`

Most of time we often want to figure out if the factors should be character. We can use `detect_factors()` to check if some of the element of the factor are not unique. Otherwise, if all of the elements are unique, you probably should use it as character.

``` r
a <- factor(c("a","b","c")) ##Should be character
b <- factor(c("a","b","b")) ##Should be factor

detect_factors(a)
#> [1] FALSE
detect_factors(b)
#> [1] TRUE
```

### `check_factors()`

If you want to check a dataframe for factors, you can use`check_factors()`. This functions will check if your dataframe contains any factors you don't want to use.

``` r
check_factors(iris)
#> [1] "Species"
check_factors(mtcars)
#> character(0)
```

### `new_factor()` and `new_factor_rev()`

The function `new_factor()` would like to set your factors to the order in which they appear in the data. In contrast, If you want the reverse order,`new_factor_rev()` can be used in your codes.

``` r
a <- factor(c("c","b","a"))
b <- factor(c("banana","apple","pear"))
levels(a)
#> [1] "a" "b" "c"
new_factor(a)
#> [1] c b a
#> Levels: c b a
levels(b)
#> [1] "apple"  "banana" "pear"
new_factor(b)
#> [1] banana apple  pear  
#> Levels: banana apple pear
```

Examples for`new_factor_rev()`:

``` r
new_factor_rev(a)
#> [1] c b a
#> Levels: a b c
new_factor_rev(b)
#> [1] banana apple  pear  
#> Levels: pear apple banana
```

### `new_reorder()`

Sometimes we may want to change the order of factors, and instead order them in descending way. The function`new_reorder()`can help you to realize it.

``` r
a <- factor(c("a","b","c"))
b <- factor(c("apple","banana","pear"))

levels(a)
#> [1] "a" "b" "c"
levels(new_reorder(a))
#> [1] "c" "b" "a"
levels(b)
#> [1] "apple"  "banana" "pear"
levels(new_reorder(b))
#> [1] "pear"   "banana" "apple"
```

Acknowledgements
----------------

-   Thanks for Jenny Bryan's [Comprehensive tutorial](http://stat545.com/packages06_foofactors-package.html)
-   Also STAT 545/547M [Lecture tutorial](http://stat545.com/cm109-110-notes_and_exercises.html)
