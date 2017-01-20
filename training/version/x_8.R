cat("Doing X.\n")
# Remark for this version of input features generation:
x.remark <- "Input features: ADX, SMA50, SMA9, putcallratio, smoothputcallratio,
iv30call, iv30put, putcallIVratio30, vola2meanvola.
Output: from 10 to 20 periods in future"
params<- list("ADXn" = 14,
              "SMA1n" = 50,
              "SMA2n" = 9,
              "smoothpcrn" = 5,
              "pcIVrperiod" = 30,
              "volmeann" = 30,
              "nl" = 10,
              "nh" = 20,
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
                          OS[,sprintf("iv%dmean", p$pcIVrperiod),],
                          smoothputcallratio(OS, p$smoothpcrn),
                          putcallIVratio(OS, p$pcIVrperiod),
                          vola2meanvola(OS, p$pcIVrperiod, p$volmeann),
                          returnADX1(TS, p$ADXn), 
                          SMAParams(TS, p$SMA1n),
                          SMAParams(TS, p$SMA2n),
                          calcPriceShifts(TS, nl=p$nl, nh=p$nh, ATRn=p$ATRn))
  }
  return(Xlist)
}

set1.RAW <- makeTrainRAW(con, set1Syms, params)
set2.RAW <- makeTrainRAW(con, set2Syms, params)
vd.RAW <- makeTrainRAW(con, vdSyms, params)

