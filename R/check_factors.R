#' Check a dataframe for factors
#'
#' We can use this function to check if your dataframe contains any factors you
#' don't want to use.
#'
#' @param x a dataframe
#'
#' @return vector
#' @export
#'
#' @examples check_factors(iris)
check_factors <- function(x){
  if(!is.data.frame(x)) {
    stop('Please enter a dataframe!\n',
         'You have provided an object of class: ', class(x)[1])}
  names(Filter(is.factor, x))
}
