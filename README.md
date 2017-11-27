
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

### `check_factors()`

### `new_factor()` and `new_factor_rev()`

### `new_reorder()`

Acknowledgements
----------------

-   Jenny Bryan and STAT 545/547M for teaching and providing resources to simplify writing an R package
