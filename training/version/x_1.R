cat("Doing X.\n")
# Remark for this version of input features generation:
x.remark <- "First toy model. Input features: ADX, EMA50, EMA9."
params<- list("ADXn" = 14,
              "EMA1n" = 50,
              "EMA2n" = 9,
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
                          EMAParams(TS, p$EMA1n),
                          EMAParams(TS, p$EMA2n),
                          calcPriceShifts(TS, nl=p$nl, nh=p$nh, ATRn=p$ATRn))
  }
  return(Xlist)
}

set1.RAW <- makeTrainRAW(con, set1Syms, params)
set2.RAW <- makeTrainRAW(con, set2Syms, params)
vd.RAW <- makeTrainRAW(con, vdSyms, params)

