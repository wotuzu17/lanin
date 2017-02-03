cat("Doing Y.\n")
y.remark <- 
"Class of ROC pos or neg after n periods. Outcome variable as numeric, not as factor"

# assume that ROC is in the last column of the data set
roc2class <- function(set.RAW){
  for (i in 1:length(set.RAW)) {
    set.RAW[[i]]$y <- set.RAW[[i]][, ncol(set.RAW[[i]])] > 0
  }
  return(set.RAW)
}

# assume that the second last column has to be dropped
makeTrainingDF <- function(set.CLASS) {
  colsToDrop <- ncol(set.CLASS[[1]]) -1
  traindf <- data.frame()
  for (i in 1:length(set.CLASS)) {
    this.TS <- set.CLASS[[i]][,-colsToDrop]
    traindf <- rbind(traindf, as.data.frame(this.TS[complete.cases(this.TS),], row.names=NULL))
  }
  return(traindf)
}

# add class information to time series in set(list)s
set1.CLASS <- roc2class(set1.RAW)
set2.CLASS <- roc2class(set2.RAW)
vd.CLASS <- roc2class(vd.RAW)

# first training set: set1; advance
# use the boundaries of set1 for this training sets
trainDF1 <- makeTrainingDF(set1.CLASS)  # use this for training
trainDF2 <- makeTrainingDF(set2.CLASS)  # use this for training
trainDFvd <- makeTrainingDF(vd.CLASS)  # use this for validation
