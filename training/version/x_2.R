cat("Doing X.\n")
# Remark for this version of input features generation:
x.remark <- "Second toy model. Input features: ADX, SMA50, SMA9. SMA instead of EMA"
params<- list("ADXn" = 14,
              "SMA1n" = 50,
              "SMA2n" = 9,
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
    Xlist[[sym]] <- cbind(returnADX1(TS, p$ADXn), 
                          SMAParams(TS, p$SMA1n),
                          SMAParams(TS, p$SMA2n),
                          calcPriceShifts(TS, nl=p$nl, nh=p$nh, ATRn=p$ATRn))
  }
  return(Xlist)
}

set1.RAW <- makeTrainRAW(con, set1Syms, params)
set2.RAW <- makeTrainRAW(con, set2Syms, params)
vd.RAW <- makeTrainRAW(con, vdSyms, params)

