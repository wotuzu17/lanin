#!/usr/bin/Rscript --vanilla
# Script examines entries in db an fills missing data from downloaded zip files
Sys.setenv(TZ="UTC")
scriptname <- "nightlyRun_feedToDb.R" # for logging

start.time <- Sys.time()
cat (paste(start.time, scriptname, "started\n"))

# global definitions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/rawfile_functions.R")
checksym <- "SPY"                       # use this symbol to determine last DataDate in o.* tables
storageDir <- "/home/voellenk/lanin_workdir/storage"

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
# rawdata files are expected to be downloaded by the nightlyRun_downloadFiles.R script
# and put into the storage folder

# search storage folder for downloaded files
fileDF <- data.frame()
downloadDatesDirs <- list.dirs(storageDir, recursive=FALSE)
for (dir in downloadDatesDirs) {
  rawfiles <- list.files(dir, pattern="^L3_\\d{8}.zip$")
  for (file in rawfiles) {
    fi <- file.info(paste(dir, file, sep="/"))
    fileDF <- rbind(fileDF, data.frame("filename" = file, 
                                       "path" = rownames(fi)[1],
                                       "date" = fi[1, "mtime"],
                                       "size" = fi[1, "size"],
                                       stringsAsFactors = FALSE))
  }
}

# o.fileDF is ordered file data.frame (newest version of each date)
o.fileDF <- data.frame()
for (file in sort(unique(fileDF$filename))) {
  allversions <- fileDF[fileDF$filename == file, ] # subset of data frame with all downloaded raw files of same date (different download dates)
  mostrecent <- allversions[with(allversions, order(date)),][nrow(allversions),]
  o.fileDF <- rbind(o.fileDF, mostrecent)
}
o.fileDF$filedate <- as.Date(sub("^.*_", "", sub(".zip$","", o.fileDF$filename)), format="%Y%m%d")


# ------------------- third: fill new raw data files to db -------------------------
# determine which rawdata files contain data that is not already in db
retDate <- function(datestring) {
  return(as.Date(datestring, format="%Y-%m-%d"))
}
lastDateInDb <- min(retDate(SQLast), retDate(OSLast), retDate(OLast))

# only process rawdatefiles that contain newer data than lastDateInDb
f.fileDF <- o.fileDF[o.fileDF$filedate > lastDateInDb, ]
for (i in 1:nrow(f.fileDF)) {
  # fill optionstats
  if (retDate(OSLast) < f.fileDF[i, "filedate"]) { # load only if rawdata is newer
    li <- extractRawFile(f.fileDF[i,"path"], "optionstats")
    if (opt$verbose) {
      cat (paste(Sys.time(), "filling", nrow(li[["optionstats"]]), "optionstats rows from file"), f.fileDF[i,"filename"] ,"\n") 
    }
    feedCsvToDb(con, li[["optionstats"]], "optionstats")
  }
  # fill stockquotes
  if (retDate(SQLast) < f.fileDF[i, "filedate"]) { # load only if rawdata is newer
    li <- extractRawFile(f.fileDF[i,"path"], "stockquotes")
    if (opt$verbose) {
      cat (paste(Sys.time(), "filling", nrow(li[["stockquotes"]]), "stockquotes rows from file"), f.fileDF[i,"filename"] ,"\n") 
    }
    feedCsvToDb(con, li[["stockquotes"]], "stockquotes")
  }  
  # fill options
  if (retDate(OLast) < f.fileDF[i, "filedate"]) { # load only if rawdata is newer
    li <- extractRawFile(f.fileDF[i,"path"], "options")
    #testsyms <- c("SPY", "AAPL", "INTC")
    if (opt$verbose) {
      cat (paste(Sys.time(), "filling", nrow(li[["options"]]), "options rows from file"), f.fileDF[i,"filename"] ,"\n") 
    }
    feedOptionsCsvToDb(con, li[["options"]])
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
