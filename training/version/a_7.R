cat("Doing A.\n")
a.remark <- "random forest parallel processing"

# shorten dimension of training data to reduce train time
shortenTrainingData <- function(full.tdf, rate){
  inTrain <- createDataPartition(full.tdf[,ncol(full.tdf)], p=1/rate)[[1]]
  return(full.tdf[inTrain,])
}

trainDF1.s <- shortenTrainingData(trainDF1, opt$rate)
trainDF2.s <- shortenTrainingData(trainDF2, opt$rate)

trainIt <- function(train) {
  numberOfCores <- detectCores()      # prepare for multi core execution
  registerDoMC(cores=numberOfCores-1) # leave one core for the OS
  fitControl <- trainControl(method = "cv", 
                             number = numberOfCores-1, 
                             allowParallel = TRUE,
                             returnData = TRUE,
                             savePredictions = FALSE,
                             returnResamp = "none")
  fit <- train(y ~ ., data=train, method="rf", trControl=fitControl)
  return(fit)
}

fit <- list()    # list of fit objects
fit.fm <- list() # list of fit-final model objects
cm <- list()     # list of confusion matrices

# train 1st data set, price advances
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 1st data set\n"))
fit[["f1"]] <- trainIt(trainDF1.s)
fit.fm[["f1"]] <- fit[["f1"]]$finalModel
time.1 <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.1, "\n"))
# check performance with validation sets
cm[["f1.os"]] <- confusionMatrix(predict(fit[["f1"]], trainDF2), trainDF2$y)
cm[["f1.vd"]] <- confusionMatrix(predict(fit[["f1"]], trainDFvd), trainDFvd$y)

#
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 2nd data set\n"))
fit[["f2"]] <- trainIt(trainDF2.s)
fit.fm[["f2"]] <- fit[["f2"]]$finalModel
time.2 <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.2, "\n"))
# check performance with validation sets
cm[["f2.os"]] <- confusionMatrix(predict(fit[["f2"]], trainDF1), trainDF1$y)
cm[["f2.vd"]] <- confusionMatrix(predict(fit[["f2"]], trainDFvd), trainDFvd$y)

