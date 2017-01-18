cat("Doing Y.\n")
y.remark <- 
"Class of upward/downward price shift in 3 non equal classes of ATR returns: boundaries @ .1; .9 
Classify price advances / declines."

# determine boundaries out of list of priceShifts
getBoundaries <- function(PSl, col, qboundaries) {
  priceshifts <- c()
  for (i in 1:length(PSl)) {
    priceshifts <- c(priceshifts, PSl[[i]][,col])
  }
  priceshifts <- priceshifts[!is.na(priceshifts)]
  return(quantile(priceshifts, qboundaries))
}

advdec2class <- function(set.RAW, name.adv.col, name.dec.col, adv.boundaries, dec.boundaries){
  for (i in 1:length(set.RAW)) {
    set.RAW[[i]]$advclass <- 0
    for (j in 1:length(adv.boundaries)) {
      set.RAW[[i]]$advclass <- set.RAW[[i]]$advclass + as.numeric(set.RAW[[i]][,name.adv.col] > adv.boundaries[j])
    }
    set.RAW[[i]]$decclass <- 0
    for (j in 1:length(dec.boundaries)) {
      set.RAW[[i]]$decclass <- set.RAW[[i]]$decclass + as.numeric(set.RAW[[i]][,name.dec.col] > dec.boundaries[j])          
    }
  }
  return(set.RAW)
}

# col can be advclass or decclass
makeTrainingDF <- function(set.CLASS, name.adv.col, name.dec.col, col) {
  colsToDrop <- c(name.adv.col, name.dec.col)
  if (col == "advclass") {
    colsToDrop <- c(colsToDrop, "decclass")
  } else if (col == "decclass") {
    colsToDrop <- c(colsToDrop, "advclass")
  } else {
    stop ("Wrong parameter")
  }
  traindf <- data.frame()
  for (i in 1:length(set.CLASS)) {
    this.TS <- set.CLASS[[i]][,!colnames(set1.CLASS[[1]]) %in% colsToDrop]
    traindf <- rbind(traindf, as.data.frame(this.TS[complete.cases(this.TS),], row.names=NULL))
  }
  colnames(traindf)[ncol(traindf)] <- "y"
  traindf$y <- factor(traindf$y)
  return(traindf)
}

qboundaries <- c(.1, .9)
# advance boundaries
set1.adv.boundaries <- getBoundaries(set1.RAW, name.adv.col, qboundaries)
set2.adv.boundaries <- getBoundaries(set2.RAW, name.adv.col, qboundaries)
vd.adv.boundaries <- getBoundaries(vd.RAW, name.adv.col, qboundaries)
# decline boundaries
set1.dec.boundaries <- getBoundaries(set1.RAW, name.dec.col, qboundaries)
set2.dec.boundaries <- getBoundaries(set2.RAW, name.dec.col, qboundaries)
vd.dec.boundaries <- getBoundaries(vd.RAW, name.dec.col, qboundaries)

# add class information to time series in set(list)s
set1.CLASS <- advdec2class(set1.RAW, name.adv.col, name.dec.col, set1.adv.boundaries, set1.dec.boundaries)
set2.CLASS <- advdec2class(set2.RAW, name.adv.col, name.dec.col, set2.adv.boundaries, set2.dec.boundaries)
vd.CLASS <- advdec2class(vd.RAW, name.adv.col, name.dec.col, vd.adv.boundaries, vd.dec.boundaries)

# first training set: set1; advance
# use the boundaries of set1 for this training sets
trainDF1a.t <- makeTrainingDF(set1.CLASS, name.adv.col, name.dec.col, "advclass")  # use this for training
trainDF1a.os <- makeTrainingDF(advdec2class(set2.RAW, name.adv.col, name.dec.col, set1.adv.boundaries, set1.dec.boundaries),
                              name.adv.col, name.dec.col, "advclass") # os=other set (for validation)
trainDF1a.vd <- makeTrainingDF(advdec2class(vd.RAW, name.adv.col, name.dec.col, set1.adv.boundaries, set1.dec.boundaries),
                              name.adv.col, name.dec.col, "advclass")

# second training set: set2; advance
trainDF2a.t <- makeTrainingDF(set2.CLASS, name.adv.col, name.dec.col, "advclass")  # use this for training
trainDF2a.os <- makeTrainingDF(advdec2class(set1.RAW, name.adv.col, name.dec.col, set2.adv.boundaries, set2.dec.boundaries),
                               name.adv.col, name.dec.col, "advclass") # os=other set (for validation)
trainDF2a.vd <- makeTrainingDF(advdec2class(vd.RAW, name.adv.col, name.dec.col, set2.adv.boundaries, set2.dec.boundaries),
                               name.adv.col, name.dec.col, "advclass")

# third training set: set1; decline
trainDF1d.t <- makeTrainingDF(set1.CLASS, name.adv.col, name.dec.col, "decclass")  # use this for training
trainDF1d.os <- makeTrainingDF(advdec2class(set2.RAW, name.adv.col, name.dec.col, set1.adv.boundaries, set1.dec.boundaries),
                               name.adv.col, name.dec.col, "decclass") # os=other set (for validation)
trainDF1d.vd <- makeTrainingDF(advdec2class(vd.RAW, name.adv.col, name.dec.col, set1.adv.boundaries, set1.dec.boundaries),
                               name.adv.col, name.dec.col, "decclass")

# fourth training set: set2; decline
trainDF2d.t <- makeTrainingDF(set2.CLASS, name.adv.col, name.dec.col, "decclass")  # use this for training
trainDF2d.os <- makeTrainingDF(advdec2class(set1.RAW, name.adv.col, name.dec.col, set2.adv.boundaries, set2.dec.boundaries),
                               name.adv.col, name.dec.col, "decclass") # os=other set (for validation)
trainDF2d.vd <- makeTrainingDF(advdec2class(vd.RAW, name.adv.col, name.dec.col, set2.adv.boundaries, set2.dec.boundaries),
                               name.adv.col, name.dec.col, "decclass")