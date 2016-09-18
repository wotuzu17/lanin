#!/usr/bin/Rscript --vanilla
# Script examines entries in db an fills missing data from downloaded zip files
Sys.setenv(TZ="UTC")
scriptname <- "nightlyRun_feedToDb_extractedFiles.R" # for logging

start.time <- Sys.time()
cat (paste(start.time, scriptname, "started\n"))

# global definitions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/rawfile_functions.R")
checksym <- "SPY"                       # use this symbol to determine last DataDate in o.* tables
storageDir <- "/home/voellenk/lanin_workdir/storage/unzipped"

suppressPackageStartupMessages(library(optparse))
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(RMySQL))

option_list <- list(
  make_option(c("-v", "--verbose"), action="store_true", default=TRUE,
              help="Print extra output [default]"))

opt <- parse_args(OptionParser(option_list=option_list))
args <- commandArgs(trailingOnly=TRUE)

if (opt$verbose) {
  cat (paste(Sys.time(), "Connect to db", lanindb$db), "on host", lanindb$host, "\n")
}
# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# ------------------- first: examine situation in DB -------------------------
# examine stockquotes table
SQSyms <- getSymsFromTbl(con, "stockquotes")
SQLast <- getLastQuoteDate(con, "stockquotes")
if (opt$verbose) {
  cat (paste(Sys.time(), "Table stockquotes contains", length(SQSyms), "symbols. Last entry:", SQLast, "\n"))
}

# examine optionstats table
OSSyms <- getSymsFromTbl(con, "optionstats")
OSLast <- getLastQuoteDate(con, "optionstats")
if (opt$verbose) {
  cat (paste(Sys.time(), "Table optionstats contains", length(OSSyms), "symbols. Last entry:", OSLast, "\n"))
}

# examine options table
OTbl <- getOptionTables(con)
OTbl <- OTbl[grep("^o\\.", OTbl$TABLE_NAME), ]
OTbl <- OTbl[with(OTbl, order(-TABLE_ROWS)), ]
OLast <- getLastOptionQuoteDate(con, checksym)
if (opt$verbose) {
  cat (paste(Sys.time(), "Database contains", nrow(OTbl), 
             "tables(symbols) with options data. Last entry for sym", 
             checksym, ":", OLast,"\n"))
}

# ------------------- second: examine available raw data files -------------------------
# this unzipped rawdata files are expected to be stored in the unzipped folder
# also, they are expected to be complete
unzippedFiles <- list.files(storageDir)
datesInUnzippedFiles <- as.Date(gsub("\\D","", sub("^L3\\D*", "", unzippedFiles)), format="%Y%m%d")
fileDF <- data.frame("filename"=unzippedFiles,
                     "path"=paste(storageDir, unzippedFiles, sep="/"),
                     "date"=datesInUnzippedFiles,
                     stringsAsFactors = FALSE)
# order fileDF by date
fileDF <- fileDF[with(fileDF, order(date)),]

# ------------------- third: fill new raw data files to db -------------------------
# determine which rawdata files contain data that is not already in db
retDate <- function(datestring) {
  return(as.Date(datestring, format="%Y-%m-%d"))
}
lastDateInDb <- min(retDate(SQLast), retDate(OSLast), retDate(OLast))

# only process rawdatefiles that contain newer data than lastDateInDb
f.fileDF <- fileDF[fileDF$date > lastDateInDb, ]
for (i in 1:nrow(f.fileDF)) {
  li <- list()
  if (grepl("_optionstats_", f.fileDF[i,"filename"])) {
    # fill optionstats
    if (retDate(OSLast) < f.fileDF[i, "date"]) { # load only if rawdata is newer
      li[["optionstats"]] <- read.csv(f.fileDF[i,"path"], stringsAsFactors = FALSE)
      if (opt$verbose) {
        cat (paste(Sys.time(), "filling", nrow(li[["optionstats"]]), "optionstats rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
      feedCsvToDb(con, li[["optionstats"]], "optionstats")
    } else {
      if (opt$verbose) {
        cat (paste(Sys.time(), "not filling optionstats rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
    }
    
  } else if (grepl("_stockquotes_", f.fileDF[i,"filename"])) {
    # fill stockquotes
    if (retDate(SQLast) < f.fileDF[i, "date"]) { # load only if rawdata is newer
      li[["stockquotes"]] <- read.csv(f.fileDF[i,"path"], stringsAsFactors = FALSE)
      if (opt$verbose) {
        cat (paste(Sys.time(), "filling", nrow(li[["stockquotes"]]), "stockquotes rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
      feedCsvToDb(con, li[["stockquotes"]], "stockquotes")
    } else {
      if (opt$verbose) {
        cat (paste(Sys.time(), "not filling stockquotes rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
    }
    
  } else if (grepl("_options_", f.fileDF[i,"filename"])) {
    # fill options
    if (retDate(OLast) < f.fileDF[i, "date"]) { # load only if rawdata is newer
      li[["options"]] <- read.csv(f.fileDF[i,"path"], stringsAsFactors = FALSE)
      testsyms <- c("SPY", "AAPL", "INTC")
      if (opt$verbose) {
        cat (paste(Sys.time(), "filling", nrow(li[["options"]]), "options rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
      feedOptionsCsvToDb(con, li[["options"]], testsyms)
    } else {
      if (opt$verbose) {
        cat (paste(Sys.time(), "not filling options rows from file"), f.fileDF[i,"filename"] ,"\n") 
      }
    }
  }
}

# diconnect from DB
if (opt$verbose) {
  cat (paste(Sys.time(), "Disconnect from db", lanindb$db, "on host", lanindb$host, "\n"))
}
dbDisconnect(con)

stop.time <- Sys.time()
cat (paste(stop.time, scriptname, "stopped, duration:", round(as.numeric(difftime(stop.time, start.time, units="mins")),1), "mins\n"))
cat ("----------------------------------------------------------------------\n")
