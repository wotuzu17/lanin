#!/usr/bin/Rscript --vanilla

# script examines data in database and creates a table with entries of each stock symbol
# for each symbol, it is determined:
#  - the number of upsplits
#  - the number of downsplits
#  - the number of timegaps
#  - whether data is available from beginning
#  - whether data is availabel until end 
# clean stocks have zero entries in every category.

Sys.setenv(TZ="UTC")
scriptname <- "make_StockQualityTable.R" # for logging
start.time <- Sys.time()
cat (paste(start.time, scriptname, "started\n"))

# load libraries
suppressPackageStartupMessages(library(optparse)) 
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(RMySQL))
suppressPackageStartupMessages(library(quantmod))
suppressPackageStartupMessages(library(TTR))

# load lanin libraries
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")

option_list <- list(
  make_option(c("-v", "--verbose"), action="store_true", default=FALSE,
              help="Print extra output [default=FALSE]"),
  make_option(c("-n", "--rebuild_table"), action="store_true", default=FALSE,
              help="completely rebuild db table a.stockquality and rewrite with new values [default=FALSE]"),
  make_option(c("-r", "--rewrite_table"), action="store_true", default=FALSE,
              help="truncate db table a.stockquality and rewrite with new values [default=FALSE]"))


opt <- parse_args(OptionParser(option_list=option_list))
# opt$verbose
# opt$rebuild_table
# opt$rewrite_table
# opt$help

referenceSym <- "SPY"  # assumind complete data for this symbol

# process each symbol
processAllSyms <- function(con, mySyms) {
  for (i in 1:length(mySyms)) {
    TS <- getSymbol(con, mySyms[i])
    if (nrow(TS) < 10) {
      feedStockQualityToDb(con, mySyms[i], 0, 0, 0, 1, 1)
    } else {
      ret <- ROC(Cl(TS))
      oret <- as.vector(ret)[order(as.vector(ret), na.last=NA)]
      # plot(oret, main=mySyms[i])
      ind <- c(index(TS), NA)
      lagind <- c(NA, index(TS))
      timegaps <- sum(as.numeric(ind - lagind) > 5, na.rm=TRUE)
      notfrombegin <- ifelse(index(TS[1]) > firstdate, 1, 0)
      nottoend <- ifelse(index(TS[nrow(TS)]) < lastdate, 1, 0)  
      # write data quality info to db
      feedStockQualityToDb(con, mySyms[i], sum(oret > .5), sum(oret < -.5), timegaps, 
                           notfrombegin, nottoend)
    }
  }
}

# connect to database (keys are in secret file)
cat (paste("connecting to database on ",lanindb$host, ".\n"))
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

availableSyms <- getSymsFromTbl(con, "stockquotes")
mySyms <- availableSyms[grep("[a-zA-Z0-9.-]", availableSyms)]

REF <- getSymbol(con, referenceSym)
firstdate <- index(REF[1])
lastdate <- index(REF[nrow(REF)])

if (opt$rebuild_table == TRUE) {
  cat("delete table a.stockquality and rebuild from scratch\n")
  dropStockQualityTbl(con)
  createStockQualityTbl(con)
  processAllSyms(con, mySyms)
} else if (opt$rewrite_table == TRUE) {
  cat ("truncate table a.stockqualiry and rewrite it with values\n")
  truncateStockQualityTbl(con)
  processAllSyms(con, mySyms)
}

dbDisconnect(con)

stop.time <- Sys.time()
cat (paste(stop.time, scriptname, "stopped, duration:", round(as.numeric(difftime(stop.time, start.time, units="mins")),1), "mins\n"))
cat ("----------------------------------------------------------------------\n")