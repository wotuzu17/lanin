#!/usr/bin/Rscript --vanilla
# script to remove erroneous Aug 2016 values from db

# global definitions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
removeBegin <- "2016-08-01"
removeEnd <- "2016-08-31"

# load libraries
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(RMySQL))

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

tbls <- getOptionTables(con)
otbls <- tbls[grep("^o\\.", tbls$TABLE_NAME),]

# remove day from table a.optionstats
cat (paste("Removing", removeBegin, "-", removeEnd, "from optionstats\n"))
deleteSpanFromTbl(con, "optionstats", removeBegin, removeEnd)

# remove day from table a.stockquotes
cat (paste("Removing", removeBegin, "-", removeEnd, "from stockquotes\n"))
deleteSpanFromTbl(con, "stockquotes", removeBegin, removeEnd)

# remove day from option tables
for (otbl in otbls$TABLE_NAME) {
  cat (paste("Removing", removeBegin, "-", removeEnd, "from", otbl, "\n"))
  deleteSpanFromOptionTbl(con, otbl, removeBegin, removeEnd)
}

dbDisconnect(con)
