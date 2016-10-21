# library of custom indicators

# calculates EMA
EMAParams <- function(TS, n=50) {
  EMA <- EMA(Cl(TS), n=n)
  dEMA <- diff(EMA)
  colnames(dEMA) <- paste0("dEMA",n)
  C_EMA <- (Cl(TS) -EMA[,1]) / Cl(TS)
  colnames(C_EMA) <- paste0("C2EMA", n)
  return(cbind(C_EMA, dEMA))
}

# returns linear model coefficients of ordered returns
returnSlope <- function(TS, n=200, slash=.1) {
  TS <- cbind(TS, "d"=NA, "k"=NA, "dn"=NA, "up"=NA)
  ret <- ROC(Cl(TS))
  slashn <- floor(n*slash)
  for (i in n:nrow(TS)) {
    retw <- as.vector(ret[(i-n+1):i])            # return window
    ordretw <- retw[order(retw, na.last=NA)]   # ordered return window
    slordretw <- ordretw[slashn:(length(ordretw)-slashn)] # slashed ordered return window
    ind <- index(slordretw)
    normind <- ind/mean(ind)-1                 # normalized index from -1 to 1
    model <- lm(slordretw ~ normind)           # linear model
    TS[i, "d"] <- model$coefficients[1]        # 1=intercept
    TS[i, "k"] <- model$coefficients[2]        # 2=k
    TS[i, "dn"] <- quantile(ordretw[1:slashn],.25) # .25 quantile of slashed lower band
    TS[i, "up"] <- quantile(ordretw[(length(ordretw)-slashn):length(ordretw)],.75) # .75 quantile of slashed upper band
  }
  return(TS[,c("d", "k", "dn", "up")])
}

# returns ADX values
returnADX <- function(TS, ADXn=14) {
  TSA <- ADX(TS, n=ADXn)
  TSA[,2] <- TSA[,2] *(-1)
  TSA <- cbind(TSA, diff(TSA[,4]))
  colnames(TSA)[ncol(TSA)] <- "dADX"
  return(TSA[,c(1,2,4,5)])
}

# on a known time series, calc buy and sell opportunities
calcBuySellSignal <- function(TS, n=5, ATRn=20, method="worst1") {
  pp <- as.numeric(gsub("\\D", "", method))
  fCl <- lag(Cl(TS), k=(pp+n)*(-1))
  if (method == "c0") {
    #Todo:Implement
    BbasePrice <- Cl(TS)
    SbasePrice <- BbasePrice
  } else if (method == "o1") {
    #Todo:Implement
    BbasePrice <- lag(Op(TS), k=-1)
    SbasePrice <- BbasePrice
  } else if (method == "c1") {
    #Todo:Implement
    BbasePrice <- lag(Cl(TS), k=-1)
    SbasePrice <- BbasePrice
  } else if (method == "worst1") {
    OC <- lag(cbind(Op(TS), Cl(TS)), k=-1)
    BbasePrice <- reclass(apply(OC, 1, max), TS)
    SbasePrice <- reclass(apply(OC, 1, min), TS)
    bDiff <- fCl[,1] - BbasePrice
    sDiff <- fCl[,1] - SbasePrice 
    Bret <- log(fCl[,1]/BbasePrice)
    colnames(Bret) <- "Bret"
    Sret <- log(fCl[,1]/SbasePrice)
    colnames(Sret) <- "Sret"
  }
  ATR <- qATR(TS, n=ATRn)
  bN <- bDiff/ATR
  sN <- sDiff/ATR
  buy <- bN > 1
  colnames(buy) <- "buy"
  sell <- sN < -1
  colnames(sell) <- "sell"
  neutral <- !(buy | sell)
  colnames(neutral) <- "neutral"
  return(cbind(buy, neutral, sell))
}

# this function returns a one-column xts object containing the average true range. 
qATR <- function (TS, n=20) {
  retvar <- ATR(cbind(Hi(TS), Lo(TS), Cl(TS)), n=n)[,"atr"]
  colnames(retvar) <- paste0("ATR", n)
  return(retvar)
}

# normalize training set by mean and standard deviation
# normx <- (x - Mean) / SD
# returns a list of:
#   * normalized data.frame
#   * column mean
#   * column sd
normalizeMeanSD <- function(df) {
  ret <- list()
  ret$colmean <- apply(df, 2, mean)
  ret$colsd <- apply(df, 2, sd)
  for(i in 1:ncol(df)) {
    df[,i] <- (df[,i] - ret$colmean[i]) / ret$colsd[i]
  }
  ret$normdf <- df
  return(ret)
}

# reverse function 
# x <- normx*sd+mean
unNormalizeMeanSD <- function(li) {
  for(i in 1:ncol(li$normdf)) {
    li$normdf[,i] <- li$normdf[,i] * li$colsd[i] + li$colmean[i]
  }
  return(li$normdf)
}

# for writing mean/sd parameters used for normalization to csv file
meanStToDf <- function(colmean, colsd) {
  df <- cbind(as.data.frame(colmean), as.data.frame(colsd))
  colnames(df) <- c("colmean", "colsd")
  return(t(df))
}

# ToDo: Write reverse function of meanStToDf