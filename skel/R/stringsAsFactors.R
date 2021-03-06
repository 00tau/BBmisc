#' Convert all character columns in data.frame to factors.
#'
#' @param data [\code{data.frame}]\cr
#'   The data.frame. 
#' @param do [\code{logical(1)}]\cr
#'   Should the conversion be done? 
#'   Useful for omitting an if-statement in client code.
#'   Default is \code{TRUE} 
#' @return [\code{data.frame}].
#' @export
stringsAsFactors = function(data, do=TRUE) {
  if (do) {
    inds = which(vapply(data, is.character, logical(1L)))
    for (j in inds)
      data[,j] = as.factor(data[,j])
  }
  return(data)
}
 