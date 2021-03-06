#' @title Private Alleles
#' @description The number of private alleles in each strata and locus.
#' 
#' @param g a \linkS4class{gtypes} object.
#' 
#' @return matrix with the number of private alleles in each strata at each 
#'   locus. This is the number of alleles only present in one stratum.
#' 
#' @author Eric Archer \email{eric.archer@@noaa.gov}
#' 
#' @seealso \link{propUniqueAlleles}
#' 
#' @examples
#' data(msats.g)
#' 
#' privateAlleles(msats.g)
#' 
#' @export
#' 
privateAlleles <- function(g) {
  if(ploidy(g) == 1 & !is.null(sequences(g))) g <- labelHaplotypes(g)$gtypes
  freqs <- alleleFreqs(g, TRUE)
  
  do.call(rbind, lapply(freqs, function(f) {
    f <- f[, "freq", , drop = FALSE]
    f[f > 0] <- 1
    pa <- rowSums(apply(f, 1, function(x) {
      if(sum(x > 0) == 1) x else rep(0, length(x))
    }))
    names(pa) <- dimnames(f)[[3]]
    pa
  }))
}