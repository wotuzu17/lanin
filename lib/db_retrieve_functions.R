# returns OHLC xts object from stockquotes table
getSymbol <- function(con, sym, from='', to='') {
  sql <- sprintf("SELECT `quotedate`, `open`, `high`, `low`, `close`, `volume`, `adjustedclose`
                 FROM `a.stockquotes` WHERE `symbol` = '%s' ORDER BY `quotedate`", sym)
  df <- suppressWarnings(dbGetQuery(con, sql))
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

# get available Options for a symbol on a given date
# returns data.frame with OptionSymbol, Type, Strike, Expiration
getOptions <- function(con, sym, date) {
  if (class(date) == "Date") {
    date <- as.character(date)
  }
  sql <- sprintf("SELECT DISTINCT `OptionSymbol`, `Type`, `Strike`, `Expiration` FROM `o.%s` WHERE `DataDate` = '%s'", sym, date)
  df <- suppressWarnings(dbGetQuery(con, sql))
  return(df)
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
  
}

