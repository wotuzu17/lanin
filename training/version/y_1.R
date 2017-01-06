y.remark <- "First toy model: Class of upward/downward price shift in quartiles of ATR returns"

# return upside/downside return nl to nh periods in the future
priceShifts <- function(con, syms, nl=1, nh=10, ATRn=20) {
  Ylist <- list()
  for (sym in syms) {
    TS <- getSymbol(con, sym)
    Ylist[[sym]] <- calcPriceShifts(TS, nl=nl, nh=nh, ATRn=ATRn)
  }
  return(Ylist)
}

# determine boundaries out of list of priceShifts
getBoundaries <- function(PSl, col, qboundaries) {
  priceshifts <- c()
  for (i in 1:length(PSl)) {
    priceshifts <- c(priceshifts, PSl[[i]][,col])
  }
  priceshifts <- priceshifts[!is.na(priceshifts)]
  return(quantile(priceshifts, qboundaries))
}

qboundaries <- c(.25, .5, .75)
set1.PS <- priceShifts(con, set1Syms)
set1.boundaries <- getBoundaries(set1.PS, 1, qboundaries)

set2.PS <- priceShifts(con, set2Syms)
set2.boundaries <- getBoundaries(set2.PS, 1, qboundaries)

vd.PS <- priceShifts(con, vdSyms)
vd.boundaries <- getBoundaries(vd.PS, 1, qboundaries)


