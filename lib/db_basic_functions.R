# get symbols from either a.optionstats or a.stockquotes table
getSymsFromTbl <- function(con, tbl) {
  sql <- sprintf("SELECT DISTINCT `symbol` FROM `a.%s`", tbl)
  result <- dbGetQuery(con, sql)
  return(as.vector(result[,1]))
}

# returns a data.frame with columns TABLE_NAME, TABLE_ROWS, UPDATE_TIME of all tables in db options
getOptionTables <- function(con) {
  sql <- "SELECT `TABLE_NAME`, `TABLE_ROWS`, `UPDATE_TIME` FROM information_schema.tables WHERE `table_schema` = 'options'"
  result <- dbGetQuery(con, sql)
  return(result)
}

# function delivers most recent quotedate entry in a table
# (as tbl, pass either optionstats, stockquotes)
# the function returns the date as character YYYY-MM-DD
getLastQuoteDate <- function(con, tbl) {
  sql <- sprintf("SELECT `quotedate` FROM `a.%s` ORDER BY `quotedate` DESC LIMIT 1", tbl)
  result <- dbGetQuery(con, sql)
  return(result[1,1])
}

# same function as above, but for o.<sym> tables
getLastOptionQuoteDate <- function(con, sym) {
  sql <- sprintf("SELECT `DataDate` FROM `o.%s` ORDER BY `DataDate` DESC LIMIT 1", sym)
  result <- dbGetQuery(con, sql)
  return(result[1,1])
}

# for which symbol already exists a o.SYM table in the db?
getSymsOptionTablesInDb <- function(con) {
  tablesInDb <- dbGetQuery(con, "SHOW TABLES;")
  o.tablesInDb <- tablesInDb[,1][grep("^o\\.", tablesInDb[,1])]
  return (sub("^o\\.", "", o.tablesInDb))
}


# this function is used for optionstats and stockquotes
# tbl must be either optionstats or stockquotes
feedCsvToDb <- function(con, df, tbl) {
  df[,"quotedate"] <- dateconvert(df[,"quotedate"]) # convert date format to YYYY-MM-DD
  sql1 <- sprintf("INSERT INTO `a.%s` VALUES (", tbl)
  for (i in 1:nrow(df)) {
    sql <- paste(sql1, paste(sprintf("'%s'", df[i,]), collapse=",") , ");", sep="")
    try(dbSendQuery(con, sql))
  }
}

feedOptionsCsvToDb <- function(con, df, symsToFill=c("allSymbols")) {
  symsInDf <- unique(df$UnderlyingSymbol)
  # determine which symbol tables are already in the db
  symsInDb <- getSymsOptionTablesInDb(con)
  # convert date columns to YYYY-MM-DD
  df[,"Expiration"] <- dateconvert(df[,"Expiration"])
  df[,"DataDate"] <- dateconvert(df[,"DataDate"])
  
  if ("allSymbols" %in% symsToFill) {
    symsToProcess <- symsInDf
  } else {
    symsToProcess <- symsToFill
  }
  
  for (sym in symsToProcess) {
    this.df <- df[df$UnderlyingSymbol == sym, c(2:ncol(df))] # only rows of UnderlyingSymbol, col UnderlyingSymbol is omitted
    # check if a o.SYM table already exists, otherwise create on
    if (!sym %in% symsInDb) {
      dbSendQuery(con, paste0(tblsql[1], sym, tblsql[2]))
      symsInDb <- c(symsInDb, sym)
    }
    
    for (i in 1:nrow(this.df)) {
      sql <- paste0("INSERT INTO `o.", sym, "` VALUES ( ", 
                    paste(sprintf("'%s'", this.df[i,]), collapse=",") , " );", sep="")
      try(dbSendQuery(con, sql))
    }    
  }
}

# SQL table scheme for o.SYM table
# full text has to be: paste0(tblsql[1], "o.SYM", tblsql[2])
tblsql <- c("CREATE TABLE IF NOT EXISTS `o.", "` (
            `UnderlyingPrice` decimal(10,4) NOT NULL,
            `Flags` char(1) NOT NULL,
            `OptionSymbol` varchar(25) NOT NULL,
            `Type` enum('call','put') NOT NULL,
            `Expiration` date NOT NULL,
            `DataDate` date NOT NULL,
            `Strike` decimal(10,4) NOT NULL,
            `Last` decimal(10,4) NOT NULL,
            `Bid` decimal(10,4) NOT NULL,
            `Ask` decimal(10,4) NOT NULL,
            `Volume` int(10) unsigned NOT NULL,
            `OpenInterest` int(10) unsigned NOT NULL,
            `T1OpenInterest` int(10) unsigned NOT NULL,
            `IVMean` float NOT NULL,
            `IVBid` float NOT NULL,
            `IVAsk` float NOT NULL,
            `Delta` float NOT NULL,
            `Gamma` float NOT NULL,
            `Theta` float NOT NULL,
            `Vega` float NOT NULL,
            `AKA` varchar(25) NOT NULL,
            PRIMARY KEY (`Type`,`Expiration`,`DataDate`,`Strike`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;")

