# skript to research volatility behaviour

library(xts)
library(TTR)
library(quantmod)
library(DBI)
library(RMySQL)

# global definitions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# test getSymbol function
syms <- c("INTC", "X", "ADM")
for (sym in syms) {
  TS <- getSymbol(con, sym)
  chartSeries(TS, name=sym)
}



dbDisconnect(con)
