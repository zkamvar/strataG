% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alleleSplit.R
\name{alleleSplit}
\alias{alleleSplit}
\title{Split Alleles For Diploid Data}
\usage{
alleleSplit(x, sep = NULL)
}
\arguments{
\item{x}{a matrix or data.frame containing diploid data. Every column 
represents one locus with two alleles.}

\item{sep}{separator used between alleles of a locus. If \code{NULL}, then 
alleles should be of equal length (e.g., 145095 = 145 and 095, or 
AG = A and G).}
}
\value{
matrix with alleles for each locus in one column split into 
  separate columns.
}
\description{
Split loci stored in one column to two columns for each allele 
  in a matrix of diploid data.
}
\examples{
# A sample SNP data set with no separators between nucleotides in a genotype
snps <- do.call(cbind, lapply(1:3, function(i) {
  a1 <- sample(c("A", "G"), 10, rep = TRUE)
  a2 <- sample(c("A", "G"), 10, rep = TRUE)
  paste(a1, a2, sep = "")
}))
colnames(snps) <- paste("Loc", LETTERS[1:3], sep = "_")
snps
alleleSplit(snps)


# A sample microsatellie data set with alleles separated by "/"
alleles <- seq(100, 150, 2)
msats <- do.call(cbind, lapply(1:3, function(i) {
  a1 <- sample(alleles, 10, rep = TRUE)
  a2 <- sample(alleles, 10, rep = TRUE)
  paste(a1, "/", a2, sep = "")
}))
colnames(msats) <- paste("Loc", LETTERS[1:3], sep = "_")
msats
alleleSplit(msats, sep = "/")

}
\author{
Eric Archer \email{eric.archer@noaa.gov}
}
