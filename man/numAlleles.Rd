% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/numAlleles.R
\name{numAlleles}
\alias{numAlleles}
\title{Number of Alleles}
\usage{
numAlleles(g)
}
\arguments{
\item{g}{a \linkS4class{gtypes} object.}
}
\value{
vector of number of alleles per locus.
}
\description{
Return the number of alleles for each locus.
}
\note{
If \code{g} is a haploid object with sequences, make sure to run 
  \code{\link{labelHaplotypes}} if sequences aren't already grouped by 
  haplotype.
}
\examples{
data(msats.g)

numAlleles(msats.g)

}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
