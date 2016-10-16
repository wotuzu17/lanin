# ToDo: Find Symbols with complete dataset, without iv = 0
# Also, there must not be a split (manually select and create blacklist)

Sys.setenv(TZ='GMT') # verwende UTC für die Auswertung
setwd("~/lanin_workdir/tmp")
script_dir <- "/home/voellenk/lanin_workdir/lanin/knitr_report/scripts"

# libraries
library(knitr)
library(DBI)
library(RMySQL)
library(ggplot2)
library(reshape2)
library(xts)
library(TTR)
library(quantmod)
library(openxlsx)

# additional functions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/old_db_functions.R")

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# which symbols are in table optionstats?
symsinOST <- getSymsFromTbl(con, "optionstats")

# build OST data.frame skeleton
symOSTdf <- data.frame("sym"= symsinOST, "count"=0, "first"= "", "last" = "",
                       "iv60min"=0, "iv60max"=0, "iv60last"=0,
                       row.names=symsinOST,
                       stringsAsFactors = FALSE)

for (sym in symsinOST) {
  res <- getStatsFromOST(con, sym)
  symOSTdf[symOSTdf$sym == sym, ] <- data.frame("sym"=sym, res, stringsAsFactors = FALSE)
}
# order by count desc, sym asc
symOSTdf <- symOSTdf[with(symOSTdf, order(-count, sym)),]

# which symbols are in table optionstats?
symsinSQT <- getSymsFromSQT(con)

# build SQT data.frame skeleton
symSQTdf <- data.frame("sym"= symsinSQT, "count"=0, "first"= "", "last" = "", 
                       row.names=symsinSQT,
                       stringsAsFactors = FALSE)

for (sym in symsinSQT) {
  res <- getStatsFromSQT(con, sym)
  symSQTdf[symSQTdf$sym == sym, ] <- data.frame("sym"=sym, res, stringsAsFactors = FALSE)
}
# order by count desc, sym asc
symSQTdf <- symSQTdf[with(symSQTdf, order(-count, sym)),]

# put into list for excel spreadsheets
listOfsymOSTdf <- list("optionstats" = symOSTdf, "stockquotes" = symSQTdf)

# write xlsx summary file
optionstats.filename <- paste0("Optionstats_", as.character(Sys.Date()),".xlsx")
write.xlsx(listOfsymOSTdf, file=optionstats.filename, asTable = FALSE) 

# ---------------------------------------------------------
# knit report (overall report)
knit2html(paste(script_dir, "optionstats_report.Rmd", sep="/"), 
          paste0("optionstats_report.html"),
          options=c('toc', 'base64_images'))

# ---------------------------------------------------------
# knit report for certain symbols
syms <- c("ADM", "AA", "INTC", "FLO", "SLW", "TSLA")
syms <- c("BBRY")
for (sym in syms) {
  knit2html(paste(script_dir, "optionstats_report_sym.Rmd", sep="/"), 
            paste0(sym, "_optionstats_report.html"),
            options=c('toc', 'base64_images'))
}

# disconnect from database
dbDisconnect(con)