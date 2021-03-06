% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/popStructTest.R
\name{popStructTest}
\alias{popStructTest}
\alias{overallTest}
\alias{pairwiseTest}
\alias{statList}
\title{Population Differentiation Tests}
\usage{
popStructTest(g, nrep = 1000, stats = "all", type = c("both", "overall",
  "pairwise"), keep.null = FALSE, quietly = FALSE, max.cores = NULL,
  write.output = FALSE, ...)

overallTest(g, nrep = 1000, stats = "all", keep.null = FALSE,
  quietly = FALSE, max.cores = NULL, ...)

pairwiseTest(g, nrep = 1000, stats = "all", keep.null = FALSE,
  quietly = FALSE, max.cores = NULL, ...)

statList(stats = "all")
}
\arguments{
\item{g}{a \code{\link{gtypes}} object.}

\item{nrep}{number specifying number of permutation replicates to use for 
permutation test.}

\item{stats}{a character vector or list of functions specifying which 
anlayses to conduct. If characters, then valid possible choices are: 
"phist", "fst", "fst.prime", "fis", "gst", "gst.prime", "gst.dbl.prime", "d", 
or "chi2", or "all". If a list, then functions must be a valid population 
structure function (see \code{\link{popStructStat}}) taking a 
\linkS4class{gtypes} object and returning a named statistic estimate.}

\item{type}{character determining type of test to conduct. Can be "overall", 
"pairwise", or "both". If "pairwise" or "both" are chosen and there are 
only two strata, then only an overall test will be conducted.}

\item{keep.null}{logical. Keep the null distribution from the 
permutation test?}

\item{quietly}{logical. Print progress and results?}

\item{max.cores}{The maximum number of cores to use to distribute separate 
statistics over. Default (NULL) sets value to what is reported by 
\code{\link[parallel]{detectCores} - 1}. Any value greater than this will 
be set to this value. If \code{detectCores} reports \code{NA}, 
\code{max.cores} will be set to 1.}

\item{write.output}{logical. Write a .csv file with results?}

\item{...}{other parameters to be passed to population 
differentiation functions.}
}
\value{
\describe{
 \item{overall}{a list containing: \describe{
   \item{\code{strata.freq}}{a vector of the sample sizes for each stratum}
   \item{\code{result}}{a matrix with the statistic estimate and p-value 
     for each statistic}
   \item{\code{null.dist}}{a matrix with the null distributions for 
     each statistic}
 }}
 \item{pairwise}{a list containing: \describe{
   \item{\code{result}}{a data.frame with the result of each pairwise 
     comparison on each row}
   \item{\code{pair.mat}}{a list with a pairwise matrix for each statistic. 
     Values in lower left are the statistic estimate, and upper right are p-values}
   \item{\code{null.dist}}{a matrix with the null distributions for 
     each statistic}
 }} 
}
}
\description{
Conduct overall and/or pairwise tests of 
  population differentiation.
}
\note{
On multi-core systems, runs of separate statistics are automatically 
  distributed over as many cores as available (minus one). This can be 
  controlled by the \code{max.cores} argument if less core usage is 
  desired.
}
\examples{
data(msats.g)
msats.g <- stratify(msats.g, "fine")

# Just an overall Chi-squared test
ovl <- overallTest(msats.g, stats = "chi2", nrep = 100)
ovl

#' Just a pairwise test for Gst
pws <- pairwiseTest(msats.g, stats = list(statGst), nrep = 100)
pws

\dontrun{
#' Both overall and pairwise tests for Fst and F'st
full <- popStructTest(msats.g, stats = c("fst", "fst.prime"))
print(full$overall)
print(full$pairwise)
}

}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
