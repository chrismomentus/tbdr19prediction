#' @title Hello world teste
#'
#' @description This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param x the name of the person
#'
#' @return the output from \code{\link{print}}
#' @export
hello <- function(x){
  print(paste0("Hello ", x, ", this is the world"))
}
