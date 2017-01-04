# Script to extract training data out of historical stockprices/option data
Sys.setenv(TZ="UTC")

# load required libraries
library(zoo)
library(xts)
library(TTR)
library(quantmod)
library(DBI)
library(RMySQL)
library(lattice)
library(ggplot2)
library(caret)
library(foreach)  # required by doMC
library(iterators)# required by doMC
library(parallel) # required by doMC
library(doMC)     # Parallel Processing for caret (doc: http://topepo.github.io/caret/parallel-processing.html)

# load lanin functions
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_basic_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")
source("/home/voellenk/lanin_workdir/lanin/lib/customIndicators.R")

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# extract cleanest symbols out of db
cleanSQsyms <- getCleanStockSymbols(con)
cleanOSsyms <- getCleanOSSymbols(con)
Syms <- table(c(cleanSQsyms, cleanOSsyms)) == 2
cleanSyms <- names(Syms[Syms==TRUE])

Set.Seed(123)
trainindex <- sample(1:length(cleanSyms), floor(length(cleanSyms)/2))
trainSyms <- cleanSyms[trainindex]
testSyms <- cleanSyms[-trainindex]

makeTrainDF <- function(trainSyms) {
  traindf <- data.frame()
  for (i in 1:length(trainSyms)) {
    TS <- getSymbol(con, trainSyms[i])
    tdf <- cbind(returnADX1(TS),
                 EMAParams(TS, 50),
                 EMAParams(TS, 9),
                 calcPriceShifts(TS))
    traindf <- rbind(traindf, as.data.frame(tdf[complete.cases(tdf),]))
  }
  row.names(traindf) <- NULL
  # try to train the amount of advance in 4 categories (quartiles)
  aboundaries <- quantile(traindf$adv_1_10, c(.25, .5, .75))
  traindf$advclass <- 0
  for (i in 1:length(aboundaries)) {
    traindf$advclass <- traindf$advclass + as.numeric(traindf$adv_1_10 > aboundaries[i])
  }
  
  dboundaries <- quantile(traindf$dec_1_10, c(.25, .5, .75))
  traindf$decclass <- 0
  for (i in 1:length(dboundaries)) {
    traindf$decclass <- traindf$decclass + as.numeric(traindf$dec_1_10 > dboundaries[i])
  }
  return(traindf)
}

combineSolver <- function(traindf) {
  # first solve only for decclass
  tdf <- traindf[,c(1,2,3,4,5,6,7,11)]
  tdf[,ncol(tdf)] <- factor(tdf[,ncol(tdf)])
  return(tdf)
}

traindf <- makeTrainDF(trainSyms)
tdf <- combineSolver(traindf)

# shorten dimension of training data to reduce train time
inTrain <- createDataPartition(tdf$decclass, p=1/5)[[1]]
train <- tdf[inTrain,]
test <- tdf[-inTrain,]

# test with other symbol (not a trainSym)
xdf <- combineSolver(makeTrainDF(testSyms[3]))

# prepare for multi core execution
registerDoMC(cores=detectCores()-1) # leave one core for the OS

# random forest training
fitControl <- trainControl(method = "cv", number = 3, allowParallel = TRUE)
start.time <- Sys.time()
rfFit <- train(decclass ~ ., data=train, method="rf", trControl=fitControl)
time.rfFit <- Sys.time() - start.time

# predict with test set (from trainSyms)
rfPred <- predict(rfFit, test)
rfCM <- confusionMatrix(rfPred, test$decclass)
rfCM

# predict with independent symbol data
rfPredx <- predict(rfFit, xdf)
confusionMatrix(rfPredx, xdf$decclass)

dbDisconnect(con)