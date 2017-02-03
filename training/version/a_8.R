cat("Doing A.\n")
a.remark <- "RSNNS application"

# shorten dimension of training data to reduce train time
shortenTrainingData <- function(full.tdf, rate){
  inTrain <- createDataPartition(full.tdf[,ncol(full.tdf)], p=1/rate)[[1]]
  return(full.tdf[inTrain,])
}

# shuffle dataset
shuffleTrainingData <- function(tdf) {
  return(tdf[sample(1:nrow(tdf), nrow(tdf)),])
}

# split for training and test (using the function of RSNNS)
splitForTT <- function(tdf, ratio=.4) {
  return(splitForTrainingAndTest(tdf[,c(1:ncol(tdf)-1)], decodeClassLabels(tdf[,ncol(tdf)]), ratio=ratio))
}

# shuffle shortened training data
trainDF1.s <- shuffleTrainingData(shortenTrainingData(trainDF1, opt$rate))
trainDF2.s <- shuffleTrainingData(shortenTrainingData(trainDF2, opt$rate))

# split for train and test
trainDF1.split <- splitForTT(trainDF1.s)
trainDF2.split <- splitForTT(trainDF2.s)

# norm training and test
trainDF1.norm <- normTrainingAndTestSet(trainDF1.split)
trainDF2.norm <- normTrainingAndTestSet(trainDF2.split)

model1 <- mlp(trainDF1.norm$inputsTrain, trainDF1.norm$targetsTrain, size=c(34),
              learnFunc = "Rprop", maxit=55, learnFuncParams=c(.001, 10, 2), 
              inputsTest = trainDF1.norm$inputsTest, targetsTest = trainDF1.norm$targetsTest)

predictions1 <- predict(model1, trainDF1.norm$inputsTest)

# return lowest iterative Test Error and number of iteration
lowestTE <- sort(model1$IterativeTestError, index.return=TRUE)
cat(paste("lowest Test Error:", round(lowestTE[[1]][1]), "@", lowestTE[[2]][1]))

plotIterativeError(model1)

plotRegressionError(predictions1, trainDF1.norm$targetsTest, pch=3)
plotROC(fitted.values(model1), trainDF1.norm$targetsTrain)
plotROC(predictions1, trainDF1.norm$targetsTest)

# confusion matrix on the training set
RSNNS::confusionMatrix(trainDF1.norm$targetsTrain, fitted.values(model1))

# confusion matrix on the training set (method 402040)
RSNNS::confusionMatrix(trainDF1.norm$targetsTrain, encodeClassLabels(fitted.values(model1),
                method="402040", l=.45, h=.55))

# confusion matrix on the test set
RSNNS::confusionMatrix(trainDF1.norm$targetsTest, predictions1)

RSNNS::confusionMatrix(trainDF1.norm$targetsTest, encodeClassLabels(predictions1,
                method="402040", l=.4, h=.6))
