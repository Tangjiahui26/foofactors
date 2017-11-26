#' Detect factor that should be character
#'
#' This function checks whether the length of the factor is equal to the length of the unique values.
#'
#' @param x a factor
#'
#' @return boolean; \code{TRUE} if input should be considered as factor,
#'         \code{FALSE} if input should be considered as character
#' @export
#'
#' @examples detect_factors(factor(c("a","b","a")))
#' detect_factors(factor(c("a","b","c")))
detect_factors <- function(x){

  if(!is.factor(x)){
    stop('Please enter a factor!\n',
         'You have provided an object of class: ', class(x)[1])
    }
    length(unique(x)) != length(x)
}
