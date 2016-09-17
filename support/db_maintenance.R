# script to remove data on a distinct day from db

# global definitions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
daytoremove <- "2016-08-22"

# load libraries
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(RMySQL))

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

tbls <- getOptionTables(con)
otbls <- tbls[grep("^o\\.", tbls$TABLE_NAME),]

# remove day from table a.optionstats
deleteDayFromTbl(con, "optionstats", daytoremove)

# remove day from table a.stockquotes
deleteDayFromTbl(con, "stockquotes", daytoremove)

# remove day from option tables
for (otbl in otbls$TABLE_NAME) {
  cat (paste("Removing", daytoremove, "from", otbl, "\n"))
  deleteDayFromOptionTbl(con, otbl, daytoremove)
}


dbDisconnect(con)

