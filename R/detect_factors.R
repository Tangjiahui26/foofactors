#' Title
#'
#' @param x a vector or a factor
#'
#' @return
#' @export
#'
#' @examples detect_factors(c("a","b","a"))
#' detect_factor(c("a","b","c"))
detect_factors <- function(x){
  #x <- is.factor(x)
  if(length(unique(x)) == length(x)){
    print("The input should be a vector of characters")
    return(TRUE)
 } else{
    print("The input is a factor")
    return(FALSE)
  }
}
