[![CRAN version](http://www.r-pkg.org/badges/version/strataG?color=red)](https://cran.r-project.org/package=strataG)
[![CRAN last day downloads](http://cranlogs.r-pkg.org/badges/last-day/strataG?color=red)](https://cran.r-project.org/package=strataG)
[![CRAN last week downloads](http://cranlogs.r-pkg.org/badges/last-week/strataG?color=red)](https://cran.r-project.org/package=strataG)
[![CRAN last month downloads](http://cranlogs.r-pkg.org/badges/strataG?color=red)](https://cran.r-project.org/package=strataG)
[![CRAN total downloads](http://cranlogs.r-pkg.org/badges/grand-total/strataG?color=red)](https://cran.r-project.org/package=strataG)  
[![Zenodo DOI](https://zenodo.org/badge/23926/EricArcher/strataG.svg)](https://zenodo.org/badge/latestdoi/23926/EricArcher/strataG)  
[![Travis-CI Build Status](https://travis-ci.org/EricArcher/strataG.svg?branch=master)](https://travis-ci.org/EricArcher/strataG)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/EricArcher/strataG?branch=master&svg=true)](https://ci.appveyor.com/project/EricArcher/strataG)  

# strataG

## Description

*strataG* is a toolkit for haploid sequence and multilocus genetic data summaries, and analyses of population structure.

## Installation

To install the stable version from CRAN:

```r
install.packages('strataG')
```

To install the latest version from GitHub:

```r
# make sure you have Rtools installed
if (!require('devtools')) install.packages('devtools')
# install from GitHub
devtools::install_github('ericarcher/strataG', build_vignettes = TRUE)
```

## Vignettes

```r
# To see the list of available vignettes
browseVignettes("strataG") 

# To open a specific vignette
vignette("gtypes")
```
* Creating and Manipulating gtypes Objects ([ gtypes](https://github.com/ericarcher/stratag/blob/master/vignettes/gtypes.Rmd))
* By-Locus Summaries ([ summaries](https://github.com/ericarcher/stratag/blob/master/vignettes/summaries.Rmd))
* Working with sequences ([ sequences](https://github.com/ericarcher/stratag/blob/master/vignettes/sequences.Rmd))
* Tests of Population Structure ([population.structure](https://github.com/ericarcher/stratag/blob/master/vignettes/population.structure.Rmd))
* Quality Assurance / Quality Control ([qaqc](https://github.com/ericarcher/stratag/blob/master/vignettes/qaqc.Rmd))
* Installing External Programs ([external.programs](https://github.com/ericarcher/stratag/blob/master/vignettes/external.programs.Rmd))

## Citation

The paper can be obtained [here](http://onlinelibrary.wiley.com/doi/10.1111/1755-0998.12559/abstract), and is cited as (preferred):   

Archer, F. I., Adams, P. E. and Schneiders, B. B. (2016), *strataG*: An *R* package for manipulating, summarizing and analysing population genetic data. Mol Ecol Resour. doi:10.1111/1755-0998.12559

If desired, the current release version of the package can be cited as:  

Archer, F. 2016. *strataG*: An *R* package for manipulating, summarizing and analysing population genetic data. R package version 1.0.6. Zenodo. http://doi.org/10.5281/zenodo.60416  

## Contact

* submit suggestions and bug-reports: <https://github.com/ericarcher/strataG/issues>
* send a pull request: <https://github.com/ericarcher/strataG/>
* e-mail: <eric.archer@noaa.gov>

## version 2.1   
* added `na.rm = TRUE` to calculation of mean locus summaries by strata in `summary.gtypes`. This avoids `NaN`s when there is a locus with genotypes missing for all samples.
* explicitly convert `x` to a `data.frame` in `df2gtypes` in case it is a `data.table` or tibble.

## version 2.0.2 (current on GitHub)

* NOTE: In order to speed up indexing the data in large data sets, this version changes the underlying structure of the `gtypes` object by replacing the `@loci` data.frame slot with a `@data` data.table slot. The data.table has a `id` character column, a `strata` character column, and every column afterwards represents one locus. The `@strata` slot has been removed.
* The `loci` accessor has been removed. 
* Added `as.array` which returns a 3-dimensional array with dimensions of [id, locus, allele].
* The print (show) function for `gtypes` objects no longer shows a by-locus summary. The display was getting too slow for data sets with a large number of loci.
* The `summary` function now includes by-sample results.
* Fixed computational errors in population structure metrics due to incorrect sorting of stratification.
* Added `maf` to return minimum allele frequency for each locus.
* Added `ldNe` to calculate Ne.
* Added `expandHaplotypes` to expand the haplotypes in a `gtypes` object to one sequence per individual.

## version 1.0.6 

* Added `read.arlequin` back. Fixed missing function error with `write.arlequin`.
* Added `summarizeSamples`
* Changed `evanno` from base graphics to ggplot2
* Updated logic in `labelHaplotypes` to assign haplotypes if possible alternative site combinations match a present haplotype
* Added Zenodo DOI
* Added shiny app (`strataGUI`) for creating gtypes objects, QA/QC, and population structure analyses
* Added `type` argument to `structurePlot` to select between area and bar charts
* Changed `haplotypeLikelihoods` to `sequenceLikelihoods`
* `neiDa` now creates haplotypes before calculating metric
* Fixed error in `writePhase` that was creating improper input files for PHASE

## version 1.0.5

* Fixed error in dupGenotypes, propSharedLoci, and propSharedIDs where missing genotypes were not being properly counted.
* Added as.data.frame.gtypes.
* Removed gtypes2df.
* Added arguments to as.matrix.gtypes to include id and strata columns in output.
* Removed the jmodeltest function as this functionality is available in the modeltest function in the phangorn package.
* Added conversion functions gtypes2phyDat and phyDat2gtypes to facilitate interoperability with the phangorn package.
* Removed read.arlequin.
* Added alleleNames accessor for gtypes object, which returns list of allele names for each locus.

## version 1.0

* New version with different gtypes format from previous versions. See vignettes for instructions and examples.