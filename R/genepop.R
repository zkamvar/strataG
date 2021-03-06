#' @name genepop
#' @title Run GENEPOP
#' @description Format output files and run GENEPOP. Filenames used are returned 
#'   so that output files can be viewed or read and parsed into R.
#' 
#' @param g a \code{\link{gtypes}} object.
#' @param output.ext character string to use as extension for output files.
#' @param show.output logical. Show GENEPOP output on console?
#' @param label character string to use to label GENEPOP input and output files.
#' @param dem integer giving the number of MCMC dememorisation or burnin steps.
#' @param batches integer giving number of MCMC batches.
#' @param iter integer giving number of MCMC iterations.
#' @param other.settings character string of optional GENEPOP command line 
#'   arguments.
#' @param input.fname character string to use for input file name.
#' @param exec name of Genepop executable
#' 
#' @note GENEPOP is not included with \code{strataG} and must be downloaded 
#'   separately. Additionally, it must be installed such that it can be run from 
#'   the command line in the current working directory. See the vignette 
#'   for \code{external.programs} for installation instructions.
#' 
#' @return \describe{
#'   \item{\code{genepop}}{a list with a vector of the locus names and a vector 
#'     of the input and output filenames}
#'   \item{\code{genepopWrite}}{a vector of the locus names used in the 
#'     input file}
#' }
#' 
#' @references GENEPOP 4.3 (08 July 2014; Rousset, 2008)\cr
#'   \url{http://kimura.univ-montp2.fr/~rousset/Genepop.htm}
#' 
#' @author Eric Archer \email{eric.archer@@noaa.gov}
#' 
#' @seealso \link{hweTest}, \link{LDgenepop}
#' 
#' @examples \dontrun{
#' # Estimate Nm for the microsatellite data
#' data(msats.g)
#' # Run Genepop for Option 4
#' results <- genepop(msats.g, output.ext = ".PRI", other.settings = "MenuOptions=4")
#' # Locus name mapping and files
#' results
#' # Show contents of output file
#' file.show(results$files["output.fname"])
#' }
#' 
#' @export
#' 
genepop <- function(g, output.ext = "", show.output = F, label = "genepop.run",
                    dem = 10000, batches = 100, iter = 5000, 
                    other.settings = "", input.fname = "loc_data.txt",
                    exec = "Genepop") {
  
  locus.names <- genepopWrite(g, label, input.fname)
  
  # Write settings file
  settings.fname <- "settings.txt"
  write(c(
    paste("InputFile=", input.fname, sep = ""),
    "Mode=Batch",
    paste("Dememorisation=", as.integer(ifelse(dem < 100, 100, dem)), sep = ""),
    paste("BatchNumber=", as.integer(ifelse(batches < 10, 10, batches)), sep = ""),
    paste("BatchLength=", as.integer(ifelse(iter < 400, 400, iter)), sep = ""),
    other.settings
  ), file = settings.fname)
  
  # Run Genepop
  genepop.cmd <- paste(exec, " settingsFile=", settings.fname, sep = "")
  
  # If user is on Windows, supply show.output.on.console = F, minimized = F, 
  #   invisible = T, else don't
  err.code <- if(.Platform$OS.type == "windows") {
    system(genepop.cmd, intern = F, ignore.stdout = !show.output, wait = T, 
           ignore.stderr = T, show.output.on.console = F, minimized = F, 
           invisible = T
    ) 
  } else {
    system(genepop.cmd, intern = F, ignore.stdout = !show.output, wait = T, 
           ignore.stderr = T) 
  }

  if(err.code == 127) {
    stop("You do not have Genepop installed.")
  } else if(err.code != 0) {
    stop(paste("Error code", err.code, "returned from Genepop.")) 
  } 
  if(show.output) cat("\n")
  files <- c(settings.fname = settings.fname, input.fname = input.fname, 
    output.fname = paste(input.fname, output.ext, sep = ""), 
    cmdline = "cmdline.txt", fichier = "fichier.in"
  )
  invisible(list(locus.names = locus.names, files = files))
}


#' @rdname genepop
#' @export
#' 
genepopWrite <- function(g, label = "genepop.write", 
                         input.fname = "loc_data.txt") {
  
  if(ploidy(g) != 2) stop("'g' must be a diploid object")
  
  # g.mat <- as.matrix(g@data)[, -(1:2)]
  # g.mat <- apply(g.mat, 2, function(x) {
  #   x <- as.numeric(as.factor(x))
  #   x[is.na(x)] <- 0
  #   max.width <- max(2, nchar(x))
  #   formatC(x, width = max.width, flag = "0")
  # })
  
  .convLoci <- function(x, ids) {
    loc <- as.numeric(x)
    loc[is.na(loc)] <- 0
    max.width <- max(2, nchar(loc))
    loc <- formatC(loc, width = max.width, flag = "0")
    df <- data.frame(ids = ids, loc = loc)
    mat <- unstack(df, loc ~ ids)
    apply(mat, 2, paste, collapse = "")
  }
  loc_dat <- g@data[, lapply(.SD, .convLoci, ids = g@data$ids), .SDcols = !c("ids", "strata")] 
  loc_dat <- as.matrix(loc_dat)
  loc_dat <- apply(loc_dat, 1, paste, collapse = " ")
  names(loc_dat) <- indNames(g)
  
  id.vec <- gsub(",", "_", names(loc_dat))
  pop.vec <- gsub(",", "_", as.character(strata(g)))
  
  locus.names <- locNames(g)
  names(locus.names) <- paste("LOC", 1:length(locus.names), sep = "")
  write(c(label, names(locus.names)), file = input.fname)
  for(pop in unique(pop.vec)) {
    write("POP", file = input.fname, append = TRUE)
    pop.rows <- which(pop.vec == pop)
    for(i in pop.rows) {
      write(paste(id.vec[i], pop, ",", loc_dat[i], collapse = " "), 
            file = input.fname, append = TRUE)
    }  
  }
  
  invisible(locus.names)
}