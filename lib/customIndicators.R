# library of custom indicators

########## stock price indicator functions ##########################
# calculates EMA
EMAParams <- function(TS, n=50) {
  EMA <- EMA(Cl(TS), n=n)
  dEMA <- diff(EMA)
  colnames(dEMA) <- paste0("dEMA",n)
  C_EMA <- (Cl(TS) -EMA[,1]) / Cl(TS)
  colnames(C_EMA) <- paste0("C2EMA", n)
  return(cbind(C_EMA, dEMA))
}

# calculates SMA
SMAParams <- function(TS, n=50) {
  SMA <- SMA(Cl(TS), n=n)
  dSMA <- diff(SMA)
  colnames(dSMA) <- paste0("dSMA",n)
  C_SMA <- (Cl(TS) -SMA[,1]) / Cl(TS)
  colnames(C_SMA) <- paste0("C2SMA", n)
  return(cbind(C_SMA, dSMA))
}

# calculates RSI
RSIParams <- function(TS, n, SMAn) {
  RSI <- RSI(Cl(TS), n=n)
  colnames(RSI) <- paste0("RSI",n)
  dSMARSI <- diff(SMA(RSI, n=SMAn))
  colnames(dSMARSI) <- paste0("dRSI",n,"_",SMAn)
  return(cbind(RSI, dSMARSI))
}

# returns ADX values
#DIp       DIn      ADX       dADX 
returnADX <- function(TS, ADXn=14) {
  TSA <- ADX(TS, n=ADXn)
  TSA[,2] <- TSA[,2] *(-1)
  TSA <- cbind(TSA, diff(TSA[,4]))
  colnames(TSA)[ncol(TSA)] <- "dADX"
  return(TSA[,c(1,2,4,5)])
}

# returns ADX values
#  ADX        dADX      DInorm
returnADX1 <- function(TS, ADXn=14) {
  TSA <- ADX(TS, n=ADXn)
  TSA <- cbind(TSA, diff(TSA[,"ADX"]))
  colnames(TSA)[ncol(TSA)] <- "dADX"
  TSA <- cbind(TSA, (TSA[,1]-TSA[,2])/(TSA[,1] + TSA[,2]))
  colnames(TSA)[ncol(TSA)] <- "DInorm"
  return(TSA[,c(4,5,6)])
}

# returns ADX values
#  ADX        dADX      DInorm   ADX*DInorm
returnADX2 <- function(TS, ADXn=14) {
  TSA <- ADX(TS, n=ADXn)
  TSA <- cbind(TSA, diff(TSA[,"ADX"]))
  colnames(TSA)[ncol(TSA)] <- "dADX"
  TSA <- cbind(TSA, (TSA[,1]-TSA[,2])/(TSA[,1] + TSA[,2]))
  colnames(TSA)[ncol(TSA)] <- "DInorm"
  TSA <- cbind(TSA, (TSA[,4] * TSA[,6]))
  colnames(TSA)[ncol(TSA)] <- "ADXxDInorm"
  return(TSA[,c(4,5,6,7)])
}

########## option stats indicator functions ##########################

# put to call ratio
putcallratio <- function(OS) {
  res <- log(OS$callvol+1) - log(OS$putvol+1)
  colnames(res) <- "pcr"
  return(res)
}

# smoothed put to call ratio (using EMA [n] of callvol and putvol)
smoothputcallratio <- function(OS, n) {
  res <- log(EMA(OS$callvol, n=n)+1) - log(EMA(OS$putvol, n=n)+1)
  colnames(res) <- paste0("pcr_", n)
  return(res)
}

# period can be 30,60,90,120,150,180,360
# value is positive when call implied volatility is lower than put implied volatility
putcallIVratio <- function(OS, period) {
  ivc <- OS[,sprintf("iv%dcall", period),]
  ivp <- OS[,sprintf("iv%dput", period),]
  ivr <- (ivc-ivp)/(ivc+ivp)
  colnames(ivr) <- sprintf("pcIVr%d", period)
  return(ivr)
}

# current implied vola to implied vola of median past n periods
vola2medianvola <- function(OS, period, n) {
  medianiv <- runMedian(OS[,sprintf("iv%dmean", period),], n=n)
  res <- OS[,sprintf("iv%dmean", period),]/medianiv - 1
  colnames(res) <- paste0("v2medIV", period)
  return(res)
}

# current implied vola to mean implied vola of past n periods
vola2meanvola <- function(OS, period, n) {
  meaniv <- runMean(OS[,sprintf("iv%dmean", period),], n=n)
  res <- OS[,sprintf("iv%dmean", period),]/meaniv -1
  colnames(res) <- paste0("v2mIV", period)
  return(res)
}

########## outcome functions #########################################

# calulates maximum up/down movement in window from t+nl to t+nh periods
# the amount of the movement is measured in terms of ATR[ATRn] periods
calcPriceShifts <- function(TS, nl=1, nh=10, ATRn=20) {
  # calculate ATR of Close first
  ATR <- qATR(TS, n=ATRn)
  lagCl <- lag(Cl(TS), k=c(nl*(-1):(nh*-1)))
  max <- reclass(apply(lagCl, 1, max), lagCl)
  min <- reclass(apply(lagCl, 1, min), lagCl)
  adv <- (max - Cl(TS))/ATR
  colnames(adv) <- sprintf("adv_%d_%d", nl, nh)
  dec <- (Cl(TS)-min)/ATR
  colnames(dec) <- sprintf("dec_%d_%d", nl, nh)
  return(cbind(adv, dec))
}

calcROC <- function(TS, n=10) {
  roc <- ROC(Cl(TS), n=n)
  colnames(roc) <- paste0("roc_", n)
  return(roc)
}

calcMomentum <- function(TS, n=10) {
  mom <- momentum(Cl(TS), n=n)
  colnames(mom) <- paste0("mom_", n)
  return(mom)
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
  pos <- fCl- Cl(TS) > 0
  colnames(pos) <- "pos"
  neg <- !pos
  colnames(neg) <- "neg"
  y <- pos + 1
  colnames(y) <- "y"
  return(cbind(buy, neutral, sell, pos, neg, y))
}

# this function returns a one-column xts object containing the average true range. 
qATR <- function (TS, n=20) {
  retvar <- ATR(cbind(Hi(TS), Lo(TS), Cl(TS)), n=n)[,"atr"]
  colnames(retvar) <- paste0("ATR", n)
  return(retvar)
}

######## not prefered functions ################################

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
