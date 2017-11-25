#' Set levels of a factor to the order appeared in data
#'
#' @param x a factor or a vector
#'
#' @return a factor with levels in the order/reverse order appeared in x.
#' @export
#'
#' @examples new_factor(c("d","b","a","d"))
#' @examples new_factor_rev(c("a","b","c","a"))
new_factor <- function(x){
  if(class(x) != "character" & class(x)!="factor"){
    stop("The x is not character or a factor")
  }
  if(length(x)/length(unique(x)) == 1){
    stop("x has distinct values")
  }
  x <- factor(x, as.character(unique(x)))
  x
}

new_factor_rev <- function(x){
  if(class(x) != "character" & class(x)!="factor"){
    stop("The x is not character or a factor")
  }
  if(length(x)/length(unique(x)) == 1){
    stop("x has distinct values")
  }
  x <- factor(x, rev(as.character(unique(x))))
  x
}
