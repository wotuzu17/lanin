# Script to extract training data out of historical stockprices/option data

# load required libraries
library("zoo")
library("xts")
library("TTR")
library("quantmod")
library("DBI")
library("RMySQL")
# load additional functions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")

# global definitions
saveTo <- "/home/voellenk/lanin_workdir/trainingData"

# Script Switches
processStockQuality <- FALSE # should Stock Quality be measured for all available syms
                             # and written to DB (needs to be done once in a while)?

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

availableSyms <- getSymsFromTbl(con, "stockquotes")

# pick random 5 symbols
mySyms <- sample(availableSyms, 5, replace=TRUE)

# empty stock quality table and fill in new findings
if (processStockQuality == TRUE) {
  truncateStockQualityTbl(con)
  # get SPY symbol, assume this one is complete
  SPY <- getSymbol(con, "SPY")
  firstdate <- index(SPY[1])
  lastdate <- index(SPY[nrow(SPY)])
  mySyms <- availableSyms[grep("[a-zA-Z0-9.-]", availableSyms)]
  for (i in 1:length(mySyms)) {
    TS <- getSymbol(con, mySyms[i])
    if (nrow(TS) < 10) {
      feedStockQualityToDb(con, mySyms[i], 0, 0, 0, 1, 1)
    } else {
      ret <- ROC(Cl(TS))
      oret <- as.vector(ret)[order(as.vector(ret), na.last=NA)]
      plot(oret, main=mySyms[i])
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

cleanSyms <- getCleanStockSymbols(con)

dbDisconnect(con)
