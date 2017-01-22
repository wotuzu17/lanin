cat("Doing X.\n")
# Remark for this version of input features generation:
library(candlesticks)
x.remark <- "Input features: ADX{2}, SMA200, SMA50, SMA10, 
RSI14, putcallratio, smoothputcallratio,
candlesticks: GapUp, GapDown"
params<- list("ADXn" = 14,
              "SMA1n" = 200,
              "SMA2n" = 50,
              "SMA3n" = 9,
              "RSIn" = 14,
              "dRSISMAn" = 3,
              "smoothpcrn" = 5,
              "nl" = 1,
              "nh" = 10,
              "ATRn" = 20)
name.adv.col <- paste0("adv_", params$nl, "_", params$nh)
name.dec.col <- paste0("dec_", params$nl, "_", params$nh)

# returns a list of all symbol time series' input vectors
makeTrainRAW <- function(con, syms, p) {
  Xlist <- list()
  for (sym in syms) {
    TS <- getSymbol(con, sym)
    OS <- getOS(con, sym)
    Xlist[[sym]] <- cbind(putcallratio(OS),
                          smoothputcallratio(OS, p$smoothpcrn),
                          returnADX2(TS, p$ADXn), 
                          SMAParams(TS, p$SMA1n),                       
                          SMAParams(TS, p$SMA2n),
                          SMAParams(TS, p$SMA3n),
                          RSIParams(TS, p$RSIn, p$dRSISMAn),
                          CSPGap(TS),
                          calcPriceShifts(TS, nl=p$nl, nh=p$nh, ATRn=p$ATRn))
  }
  return(Xlist)
}

set1.RAW <- makeTrainRAW(con, set1Syms, params)
set2.RAW <- makeTrainRAW(con, set2Syms, params)
vd.RAW <- makeTrainRAW(con, vdSyms, params)

