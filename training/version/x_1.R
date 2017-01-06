# Remark for this version of input features generation:
x.remark <- "First toy model. Input features: ADX, EMA50, EMA9."

# returns a list of all symbol time series' input vectors
makeTrainX <- function(con, syms) {
  Xlist <- list()
  for (sym in syms) {
    TS <- getSymbol(con, sym)
    Xlist[[sym]] <- cbind(returnADX1(TS), 
                          EMAParams(TS, 50),
                          EMAParams(TS, 9))
  }
  return(Xlist)
}

set1.X <- makeTrainX(con, set1Syms)
set2.X <- makeTrainX(con, set2Syms)
vd.X <- makeTrainX(con, vdSyms)
