# OST = optionstats table
getSymsFromOST <- function(con) {
  sql <- "SELECT DISTINCT `symbol` FROM `a.optionstats`"
  result <- dbGetQuery(con, sql)
  return(as.vector(result[,1]))
}

# get number of rows for a symbol in OST
getRowCountFromOST <- function(con, sym) {
  sql <- sprintf("SELECT COUNT( * ) FROM `a.optionstats` WHERE `symbol` = '%s'", sym)
  result <- dbGetQuery(con, sql)
  if (class(result) == "data.frame") {
    return(as.vector(result[,1]))   
  }
}

# get rowcount, begindate, enddate for a symbol in OST
getStatsFromOST <- function(con, sym) {
  sql1 <- sprintf("SELECT COUNT( * ) FROM `a.optionstats` WHERE `symbol` = '%s'", sym)
  sql2 <- sprintf("SELECT `quotedate` FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `quotedate` ASC LIMIT 1", sym)
  sql3 <- sprintf("SELECT `quotedate` FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `quotedate` DESC LIMIT 1", sym)
  sql4 <- sprintf("SELECT `quotedate`,`iv60mean` FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `iv60mean` ASC LIMIT 1", sym)
  sql5 <- sprintf("SELECT `quotedate`,`iv60mean` FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `iv60mean` DESC LIMIT 1", sym)
  sql6 <- sprintf("SELECT `quotedate`,`iv60mean` FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `quotedate` DESC LIMIT 1", sym)
  result1 <- dbGetQuery(con, sql1)
  result2 <- dbGetQuery(con, sql2)
  result3 <- dbGetQuery(con, sql3)
  result4 <- dbGetQuery(con, sql4)
  result5 <- dbGetQuery(con, sql5)
  result6 <- dbGetQuery(con, sql6)
  result <- data.frame("count" = result1[1,1], "first" = result2[1,1], "last" = result3[1,1], 
                       "iv60min"= result4[1,2], "iv60max"=result5[1,2], "iv60last"=result6[1,2],
                       stringsAsFactors = FALSE)
  return(result)
}

# SQT = stockquotes table
getSymsFromSQT <- function(con) {
  sql <- "SELECT DISTINCT `symbol` FROM `a.stockquotes`"
  result <- dbGetQuery(con, sql)
  return(as.vector(result[,1]))
}

# get number of rows for a symbol in SQT
getRowCountFromSQT <- function(con, sym) {
  sql <- sprintf("SELECT COUNT( * ) FROM `a.stockquotes` WHERE `symbol` = '%s'", sym)
  result <- dbGetQuery(con, sql)
  if (class(result) == "data.frame") {
    return(as.vector(result[,1]))   
  }
}

# get rowcount, begindate, enddate for a symbol in OST
getStatsFromSQT <- function(con, sym) {
  sql1 <- sprintf("SELECT COUNT( * ) FROM `a.stockquotes` WHERE `symbol` = '%s'", sym)
  sql2 <- sprintf("SELECT `quotedate` FROM `a.stockquotes` WHERE `symbol` = '%s' ORDER BY `quotedate` ASC LIMIT 1", sym)
  sql3 <- sprintf("SELECT `quotedate` FROM `a.stockquotes` WHERE `symbol` = '%s' ORDER BY `quotedate` DESC LIMIT 1", sym)
  result1 <- dbGetQuery(con, sql1)
  result2 <- dbGetQuery(con, sql2)
  result3 <- dbGetQuery(con, sql3)
  result <- data.frame("count" = result1[1,1], "first" = result2[1,1], "last" = result3[1,1], stringsAsFactors = FALSE)
}

# get option stats for a distinct symbol
# pass begin and end as string like 2015-01-01
getOST <- function(con, sym, begin=FALSE, end=FALSE) {
  if (begin == FALSE) {
    bstring <- ""
  } else {
    bstring <- sprintf("AND `quotedate` >= '%s'", begin)
  }
  if (end == FALSE) {
    estring <- ""
  } else {
    estring <- sprintf("AND `quotedate` <= '%s'", end)
  }
  sql <- sprintf("SELECT * FROM `a.optionstats` WHERE `symbol` = '%s' %s %s ORDER BY `quotedate`", sym, bstring, estring)
  result <- suppressWarnings(dbGetQuery(con, sql))
  result$quotedate <- as.Date(result$quotedate, "%Y-%m-%d")
  return(result)
}

getSQ <- function(con, sym, as.xts=FALSE) {
  sql <- sprintf("SELECT `quotedate`, `open`, `high`, `low`, `close`, `volume` FROM 
                 `a.stockquotes` WHERE `symbol` = '%s' ORDER BY `quotedate`", sym)
  result <- suppressWarnings(dbGetQuery(con, sql))
  result$quotedate <- as.Date(result$quotedate, "%Y-%m-%d")
  if (as.xts == FALSE) {
    return(result)   
  } else {
    return(as.xts(result[,-1], order.by=result$quotedate))
  }
}

# plot Put and Call Open Interest
plotPCOI <- function(con, sym) {
  res <- getOST(con, sym)
  dd <- melt(res[,c("quotedate", "calloi", "putoi")], id.vars="quotedate")
  ggplot(dd, aes(quotedate, value)) + geom_line(aes(color=variable)) +
    ggtitle(paste(sym, "Put Call Open Interest")) +
    scale_y_continuous(labels = scales::scientific) +
    theme_bw()
}

# plot Put and Call Volume
plotPCV <- function(con, sym) {
  res <- getOST(con, sym)
  dd <- melt(res[,c("quotedate", "callvol", "putvol")], id.vars="quotedate")
  ggplot(dd, aes(quotedate, value)) + geom_point(aes(color=variable)) +
    ggtitle(paste(sym, "Put Call Volume")) +
    scale_y_continuous(labels = scales::scientific) +
    theme_bw()
}

# plot IV over time
plotIV <- function(con, sym, periods=c(60)) {
  res <- getOST(con, sym)
  periodcols <- paste0("iv", periods, "mean")
  dd <- melt(res[,c("quotedate", periodcols)],
             id.vars="quotedate")
  ggplot(dd, aes(quotedate, value)) + geom_point(aes(color=variable)) +
    ggtitle(paste(sym, "Implied Volatility")) +
   # scale_y_continuous(labels = scales::scientific) +
    theme_bw()
}

# plot stock price
plotPrice <- function(con, sym) {
  chartSeries(getSQ(con, sym, as.xts=TRUE))
}
