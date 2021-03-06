#' Compute statistical mode of a vector (value that occurs most frequently).
#'
#' Works for integer, numeric, factor and character vectors.
#' The implementation is currently not extremely efficient.
#'
#' @param x [\code{vector}]\cr
#'   Factor, character, integer, numeric or logical vector.
#' @param na.rm [\code{logical(1)}]\cr
#'   If \code{TRUE}, missing values in the data removed.
#'   if \code{FALSE}, they are used as a separate level and this level could therefore 
#'   be returned as the most frequent one.
#'   Default is \code{TRUE}.
#' @param ties.method [\code{character(1)}]\cr 	
#'   \dQuote{first}, \dQuote{random}, \dQuote{last}: Decide which value to take in case of ties.   
#'   Default is \dQuote{random}.
#' @return Modal value of length 1, data type depends on data type of x. 
#' @export
#' @examples
#' computeMode(c(1,2,3,3))
#FIXME: no arg checks for speed currently
computeMode = function(x, ties.method="random", na.rm=TRUE) {  
  tab = table(x, useNA=ifelse(na.rm, "no", "ifany"))
  y = max(tab)
  mod = names(tab)[tab == y]
  if (!is.factor(x))
    mode(mod) = mode(x)
  if (length(mod) > 1L) 
    switch(ties.method, 
      first = mod[1L], 
      random = sample(mod, 1),
      last = mod[length(mod)]
    )
  else 
    mod
}
