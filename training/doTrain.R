#!/usr/bin/Rscript --vanilla

# script performs training according to command line arguments
# it is used to perform time consuming machine learning trainings
# the model and results on validation data set are archived in
# RData file and a knitr report of the outcome is generated.

Sys.setenv(TZ="UTC")
scriptname <- "doTrain.R" # for logging
global.start.time <- Sys.time()
cat (paste(global.start.time, scriptname, "started\n"))

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
suppressPackageStartupMessages(library(randomForest))
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
  make_option(c("-k", "--kversion"), type="integer", default=0,
              help="Knitr report scheme to create [default %default]", metavar="number"),
  make_option(c("-r", "--rate"), type="integer", default=5,
              help="Use 1/r training rows out of all available rows. Greater r = shorter training time. [default %default]", metavar="number"),  
  make_option(c("-s", "--seed"), type="integer", default=123,
              help="Random generator seed [default %default]", metavar="number"))

opt <- parse_args(OptionParser(option_list=option_list))
cat ("The script was called with these parameters:\n")
opt

# for debug
if (opt$xversion == 0) {
  opt<-list()
  opt$xversion <- 11
  opt$yversion <- 7
  opt$aversion <- 7
  opt$kversion <- 2
  opt$rate <- 100
  opt$seed <- 234
}


# connect to database (keys are in secret file)
cat (paste0("connecting to database on ",lanindb$host, ".\n"))
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

source(sprintf("/home/voellenk/lanin_workdir/lanin/training/version/a_%d.R", opt$kversion))

global.stop.time <- Sys.time()
cat (paste(global.stop.time, scriptname, "stopped, duration:", 
           round(as.numeric(difftime(global.stop.time, global.start.time, units="mins")),1), "mins\n"))
cat ("----------------------------------------------------------------------\n")