% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sequenceLikelihoods.R
\name{sequenceLikelihoods}
\alias{sequenceLikelihoods}
\title{Sequence Likelihoods}
\usage{
sequenceLikelihoods(x, model = "N", pairwise.deletion = FALSE, n = NULL,
  ...)
}
\arguments{
\item{x}{a \code{\link[ape]{DNAbin}} object.}

\item{model}{a character string specifying the evolutionary model to be 
used. Passed to \code{\link[ape]{dist.dna}}.}

\item{pairwise.deletion}{a logical indicating whether to delete the 
sites with missing data in a pairwise way. Passed to 
\code{\link[ape]{dist.dna}}.}

\item{n}{number of sequences with lowest delta(log-likelihoods) to 
plot. Defaults to all sequences Set to 0 to supress plotting.}

\item{...}{arguments passed from other functions (ignored).}
}
\value{
vector of delta(log-Likelihoods) for each sequence, sorted from 
  smallest to largest, and a plot of their distributions.
}
\description{
Calculate likelihood of each sequence based on gamma 
  distribution of pairwise distances.
}
\details{
Fits a Gamma distribution to the pairwise distances of sequences 
  and calculates the log-likelihood for each (sum of all pairwise 
  log-likelihoods for that sequence). Sequences that are extremely 
  different from all others will have low log-likelihoods. Values returned 
  as delta(log-likelhoods) = difference of log-likelihoods from maximum 
  observed values.
}
\examples{
library(ape)
data(dolph.haps)

sequenceLikelihoods(as.DNAbin(dolph.haps))

}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
