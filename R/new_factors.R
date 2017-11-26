#' Set levels of a factor to the order appeared in data
#'
#' @param x a factor
#'
#' @return a factor with levels in the order appeared in x.
#' @export
#'
#' @examples new_factor(factor(c("d","b","a","d")))
new_factor <- function(x){
  if(!is.factor(x)){
    stop('Please enter a factor!\n',
         'You have provided an object of class: ', class(x)[1])
  }
  x <- factor(x, as.character(unique(x)))
  x
}

#' Set levels of a factor to the reverse order appeared in data
#'
#' @param x a factor
#'
#' @return a factor with levels in the reverse order appeared in x.
#' @export
#'
#' @examples new_factor_rev(factor(c("a","b","c","a")))
new_factor_rev <- function(x){
  if(!is.factor(x)){
    stop('Please enter a factor!\n',
         'You have provided an object of class: ', class(x)[1])
  }
  x <- factor(x, rev(as.character(unique(x))))
  x
}
