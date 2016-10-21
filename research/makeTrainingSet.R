# Script to extract training data out of historical stockprices/option data
Sys.setenv(TZ="UTC")

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

# pick random 25 symbols
mySyms <- sample(cleanSyms, 25, replace=TRUE)

# calculate indicators and prediction for mySyms
traindf <- data.frame()
for (i in 1:length(mySyms)) {
  TS <- getSymbol(con, mySyms[i])
  tdf <- cbind(returnADX(TS), 
               EMAParams(TS),
               returnSlope(TS), 
               calcBuySellSignal(TS))
  traindf <- rbind(traindf, as.data.frame(tdf[complete.cases(tdf),]))
}

# determine traindf Inputs
coln <- colnames(traindf)
outp.names <- c("buy", "neutral", "sell")
inp.names <- coln[!coln %in% outp.names]

# normalize traindf Inputs
nlist<- normalizeMeanSD(traindf[,inp.names])

# add output to normalized traindf Inputs
nlist$normdf <- cbind(nlist$normdf, traindf[,outp.names])

# save traindf as table
DateString <- format(Sys.time(), "%Y%m%d_%H%M")
write.table(nlist$normdf, 
            file=paste0(saveTo, "/", DateString, "_normTrainData.csv"), 
            row.names=FALSE)

write.table(meanStToDf(nlist$colmean, nlist$colsd),
            file=paste0(saveTo, "/", DateString, "_normMeanSd.csv"),
            row.names=FALSE)

dbDisconnect(con)
