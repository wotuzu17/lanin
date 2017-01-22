cat("Doing A.\n")
a.remark <- "Use only single core processing to prevent excessive memory consumption.
Use rf with importance=TRUE"

# shorten dimension of training data to reduce train time
shortenTrainingData <- function(full.tdf, rate){
  inTrain <- createDataPartition(full.tdf[,ncol(full.tdf)], p=1/rate)[[1]]
  return(full.tdf[inTrain,])
}

simpleSampleShortTrainingData <- function(full.tdf, rate) {
  inTrain <- sample(1:nrow(full.tdf), nrow(full.tdf)/rate)
  return(full.tdf[inTrain,])
}

trainDF1a.t.s <- shortenTrainingData(trainDF1a.t, opt$rate)
trainDF2a.t.s <- shortenTrainingData(trainDF2a.t, opt$rate)
trainDF1d.t.s <- shortenTrainingData(trainDF1d.t, opt$rate)
trainDF2d.t.s <- shortenTrainingData(trainDF2d.t, opt$rate)

trainIt <- function(train) {
  fitControl <- trainControl(method = "cv", 
                             returnData = TRUE,
                             returnResamp = "none")
  fit <- train(y ~ ., data=train, method="rf", importance=TRUE, trControl=fitControl)
  return(fit)
}

fit <- list()    # list of fit objects
fit.fm <- list() # list of fit-final model objects
cm <- list()     # list of confusion matrices

# train 1st data set, price advances
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 1st data set, price advances---\n"))
fit[["f1a"]] <- trainIt(trainDF1a.t.s)
fit.fm[["f1a"]] <- fit[["f1a"]]$finalModel
time.1a <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.1a, "\n"))
# check performance with validation sets
cm[["f1a.os"]] <- confusionMatrix(predict(fit[["f1a"]], trainDF1a.os), trainDF1a.os$y)
cm[["f1a.vd"]] <- confusionMatrix(predict(fit[["f1a"]], trainDF1a.vd), trainDF1a.vd$y)

# train 2nd data set, price advances
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 2nd data set, price advances---\n"))
fit[["f2a"]] <- trainIt(trainDF2a.t.s)
fit.fm[["f2a"]] <- fit[["f2a"]]$finalModel
time.2a <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.2a, "\n"))
# check performance with validation sets
cm[["f2a.os"]] <- confusionMatrix(predict(fit[["f2a"]], trainDF2a.os), trainDF2a.os$y)
cm[["f2a.vd"]] <- confusionMatrix(predict(fit[["f2a"]], trainDF2a.vd), trainDF2a.vd$y)

# train 1st data set, price declines
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 1st data set, price declines---\n"))
fit[["f1d"]] <- trainIt(trainDF1d.t.s)
fit.fm[["f1d"]] <- fit[["f1d"]]$finalModel
time.1d <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.1d, "\n"))
# check performance with validation sets
cm[["f1d.os"]] <- confusionMatrix(predict(fit[["f1d"]], trainDF1d.os), trainDF1d.os$y)
cm[["f1d.vd"]] <- confusionMatrix(predict(fit[["f1d"]], trainDF1d.vd), trainDF1d.vd$y)

# train 2nd data set, price declines
start.time <- Sys.time()
cat (paste(start.time, "---Start training of 2nd data set, price declines---\n"))
fit[["f2d"]] <- trainIt(trainDF2d.t.s)
fit.fm[["f2d"]] <- fit[["f2d"]]$finalModel
time.2d <- Sys.time() - start.time
cat (paste(Sys.time(), "### ### Completed training ### ### Duration", time.2d, "\n"))
# check performance with validation sets
cm[["f2d.os"]] <- confusionMatrix(predict(fit[["f2d"]], trainDF2d.os), trainDF2d.os$y)
cm[["f2d.vd"]] <- confusionMatrix(predict(fit[["f2d"]], trainDF2d.vd), trainDF2d.vd$y)
