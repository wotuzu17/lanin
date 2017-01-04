# returns OHLC xts object from stockquotes table
getSymbol <- function(con, sym, from='', to='') {
  sql <- sprintf("SELECT `quotedate`, `open`, `high`, `low`, `close`, `volume`, `adjustedclose`
                 FROM `a.stockquotes` WHERE `symbol` = '%s' ORDER BY `quotedate`", sym)
  df <- suppressWarnings(dbGetQuery(con, sql))
  colnames(df)[ncol(df)] <- "adjusted"
  if (nrow(df) < 1) {
    return(FALSE)
  }
  df[,1] <- as.Date(df[,1]) # convert datestring to Date
  return(xts(df[,-1], order.by=df[,1]))
}

# returns xts object from optionstats table
getOS <- function(con, sym, from='', to='') {
  sql <- sprintf("SELECT * FROM `a.optionstats` WHERE `symbol` = '%s' ORDER BY `quotedate`", sym)
  df <- suppressWarnings(dbGetQuery(con, sql))
  if (nrow(df) < 1) {
    return(FALSE)
  }
  df[,2] <- as.Date(df[,2])
  return(xts(df[,-c(1,2)], order.by=df[,2]))
}

# returns optionsstats for a symbol on one day
getOSdate <- function(con, sym, date) {
  sql <- sprintf("SELECT * FROM `a.optionstats` WHERE `symbol` = '%s' AND `quotedate` = '%s'", sym, date)
  df <- suppressWarnings(dbGetQuery(con, sql))
  return (df[,-1])
}

# get available Options for a symbol on a given date
# returns list with $UnderlyingPrice and $df data.frame with OptionSymbol, Type, Strike, Expiration
getOptions <- function(con, sym, date) {
  if (class(date) == "Date") {
    date <- as.character(date)
  }
  res <- list()
  sql <- sprintf("SELECT DISTINCT `UnderlyingPrice`, `OptionSymbol`, `Type`, `Strike`, `Expiration` FROM `o.%s` WHERE `DataDate` = '%s'", sym, date)
  df <- suppressWarnings(dbGetQuery(con, sql))
  UnderlyingPrice <- unique(df[,1])
  if (length(UnderlyingPrice) > 1) {
    warning(paste("DB Problem: More than one UnderlyingPrice for", sym, ":", UnderlyingPrice))
  }
  return(list("UnderlyingPrice"=UnderlyingPrice, "df" = df[,-1]))
}

# get Prices for a distinct optionsymbol
# returns a xts object with attributes
getOptionSymbol <- function(con, optsym) {
  sym <- sub("\\d.*", "", optsym)  # extract symbol string out of OptionSymbol
  sql <- sprintf("SELECT * FROM `o.%s` WHERE `OptionSymbol` = '%s' ORDER BY `DataDate`", sym, optsym)
  df <- suppressWarnings(dbGetQuery(con, sql))
  df[,6] <- as.Date(df[,6])
  x <- xts(df[,-c(2,3,4,5,6,7,21)], order.by=df[,6])
  xtsAttributes(x) <- list("OptionSymbol" = optsym,
                           "Type" = df[1,"Type"],
                           "Expiration" = df[1,"Expiration"],
                           "Strike" = df[1,"Strike"],
                           "AKA" = df[1,"AKA"])
  return(x)
}

# returns on the money options for a given symbol and date
getOTMOptions <- function(con, sym, date) {
  res <- data.frame()
  li <- getOptions(con, sym, date)
  li$df$PriceDiff <- li$UnderlyingPrice - li$df$Strike
  li$df$ROC <- log(li$df$Strike) - log(li$UnderlyingPrice)
  li$df$DaysToMaturity <- as.numeric(as.Date(li$df$Expiration) - as.Date(date))
  for (exp in unique(li$df$Expiration)) {
    dd <- li$df[li$df$Expiration == exp,]
    ddp <- dd[dd$Type == "put",]
    ddc <- dd[dd$Type == "call",]
    OTMP <- ddp[with(ddp, order(abs(ROC))),][1,]
    OTMC <- ddc[with(ddc, order(abs(ROC))),][1,]
    res <- rbind(res, OTMP, OTMC)
  }
  return(res)
}

# get stock symbols without split and full data coverage
getCleanStockSymbols <- function(con) {
  sql <- "SELECT `symbol`
          FROM `a.stockquality`
          WHERE `upsplit` =0
          AND `downsplit` =0
          AND `timegaps` =0
          AND `notfrombegin` =0
          AND `nottoend` =0"
  return(dbGetQuery(con, sql)[,1])
}

# get optionstats symbols without zero IV and full data coverage
getCleanOSSymbols <- function(con) {
  sql <- "SELECT `symbol`
          FROM `a.optionstatsquality`
          WHERE `iv30zeros` =0
          AND `iv60zeros` =0
          AND `iv90zeros` =0
          AND `iv120zeros` =0
          AND `iv150zeros` =0
          AND `iv180zeros` =0
          AND `iv360zeros` =0
          AND `timegaps` =0
          AND `notfrombegin` =0
          AND `nottoend` =0"
  return(dbGetQuery(con, sql)[,1])
}



