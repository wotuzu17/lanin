#!/usr/bin/Rscript --vanilla

# script performs training according to command line arguments
# it is used to perform time consuming machine learning trainings
# the model and results on validation data set are archived in
# RData file and a knitr report of the outcome is generated.

Sys.setenv(TZ="UTC")
scriptname <- "doTrain.R" # for logging
start.time <- Sys.time()
cat (paste(start.time, scriptname, "started\n"))

# load required libraries
suppressPackageStartupMessages(library(optparse))
suppressPackageStartupMessages(library(zoo))
suppressPackageStartupMessages(library(xts))
suppressPackageStartupMessages(library(TTR))
suppressPackageStartupMessages(library(quantmod))
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(RMySQL))
suppressPackageStartupMessages(library(lattice))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(caret))
suppressPackageStartupMessages(library(foreach))  # required by doMC
suppressPackageStartupMessages(library(iterators))# required by doMC
suppressPackageStartupMessages(library(parallel)) # required by doMC
suppressPackageStartupMessages(library(doMC))     # Parallel Processing for caret (doc: http://topepo.github.io/caret/parallel-processing.html)
suppressPackageStartupMessages(library(knitr))

# load lanin functions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/customIndicators.R")

# some global variables
knitrReportDir <- "/home/voellenk/Dropbox/lanin/TrainReports"
trainDataDir <- "/home/voellenk/Dropbox/lanin/TrainData"

# provide optparse options
option_list <- list(
  make_option(c("-x", "--xversion"), type="integer", default=0,
              help="Version to build training features (inputs) [default %default]", metavar="number"),
  make_option(c("-y", "--yversion"), type="integer", default=0,
              help="Version to build outcome variable [default %default]", metavar="number"),
  make_option(c("-a", "--aversion"), type="integer", default=0,
              help="Machine Learning Algorithm to use [default %default]", metavar="number"),  
  make_option(c("-s", "--seed"), type="integer", default=123,
              help="Random generator seed [default %default]", metavar="number"))

opt <- parse_args(OptionParser(option_list=option_list))
cat ("The script was called with these parameters:\n")
opt

# connect to database (keys are in secret file)
cat (paste("connecting to database on",lanindb$host, ".\n"))
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# extract cleanest symbols out of db
cleanSQsyms <- getCleanStockSymbols(con)
cleanOSsyms <- getCleanOSSymbols(con)
Syms <- table(c(cleanSQsyms, cleanOSsyms)) == 2
cleanSyms <- names(Syms[Syms==TRUE])

# build training set 1 (2/5) 2 (2/5) and validation set (1/5)
set.seed(opt$seed)
validationindex <- sample(1:length(cleanSyms), floor(length(cleanSyms)/5))
vdSyms <- cleanSyms[validationindex]
setSyms <- cleanSyms[-validationindex]
set1index <- sample(1:length(setSyms), round(length(setSyms)/2))
set1Syms <- setSyms[set1index]
set2Syms <- setSyms[-set1index]

# create learning set features
source(sprintf("/home/voellenk/lanin_workdir/lanin/training/version/x_%d.R", opt$xversion))
# create outcome variable
source(sprintf("/home/voellenk/lanin_workdir/lanin/training/version/y_%d.R", opt$yversion))
# train with given algo
source(sprintf("/home/voellenk/lanin_workdir/lanin/training/version/a_%d.R", opt$aversion))


dbDisconnect(con)
#############################################################################

# create knitr report
knit2html("/home/voellenk/lanin_workdir/lanin/training/TrainReport.Rmd",
          paste0(knitrReportDir, "/", format(start.time, "%Y-%m-%d_%H-%M"), 
          "_x_", opt$xversion,
          "_y_", opt$yversion,
          "_seed_", opt$seed,
          ".html"))

stop.time <- Sys.time()
cat (paste(stop.time, scriptname, "stopped, duration:", round(as.numeric(difftime(stop.time, start.time, units="mins")),1), "mins\n"))
cat ("----------------------------------------------------------------------\n")