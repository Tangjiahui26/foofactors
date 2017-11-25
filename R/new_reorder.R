#' A new version of reorder() that uses desc()
#'
#' @param x a factor or a vector
#' @return a factor with levels in the order/reverse order appeared in input.
#' @export
#'
#' @examples new_reorder(c("c","b","a"))
new_reorder <- function(x){
  if(is.null(x)){
    stop("Please enter a factor")
  }
  reorder(x, dplyr::desc(x))
}
