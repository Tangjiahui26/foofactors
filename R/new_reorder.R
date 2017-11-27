#' A new version of reorder that uses desc
#'
#' This function give you the ability to sort your factors in descending order.
#'
#' @param x a factor or a vector
#' @return a factor
#' @export
#'
#' @examples new_reorder(factor(c("c","b","a")))
new_reorder <- function(x){
  if(!is.factor(x)){
    stop('Please enter a factor!\n',
         'You have provided an object of class: ', class(x)[1])
  }
  stats::reorder(x, dplyr::desc(x))
}
