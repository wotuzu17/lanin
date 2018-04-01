# calculate relative strenght (Levy)

library(xts)
library(TTR)
library(quantmod)
library(DBI)
library(RMySQL)
library(openxlsx)
library(caret)
library(randomForest)
library(foreach)       # required by doMC
library(iterators)     # required by doMC
library(parallel)      # required by doMC
library(doMC)

# global definitions
timewindow <- 25 # number of weeks to calculate average
nreturn <- 5 # number of weeks to calculate future returns
seed <- 123

# lanin libraries
source("/home/voellenk/.lanindb.R")     # secret key file
source("/home/voellenk/lanin_workdir/lanin/lib/db_retrieve_functions.R")

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

# get clean symbols
syms <- getCleanStockSymbols(con)

logrslist <- list()
TSlist <- list()
for (i in 1:length(syms)) {
  TS <- getSymbol(con, syms[i])
  this.wTS <- to.weekly(TS)
  this.wTS$av <- runMean(Cl(this.wTS), n=timewindow)
  this.wTS$logrs <- log(Cl(this.wTS)/this.wTS$av)
  # add colums with future returns
  for (j in 1:nreturn) {
    this.wTS <- cbind(this.wTS, lag(ROC(Cl(this.wTS), n=j), k=j*(-1)))
    colnames(this.wTS)[ncol(this.wTS)] <- paste0("ret.", j)
  }
  # add performance analytics to this.wTS
  retcols <- grep("ret", colnames(this.wTS))
  this.wTS$allpos <- as.vector(ifelse(apply(this.wTS[,retcols], 1, min) > 0, 1, 0)) # all future n returns are positive
  this.wTS$allneg <- as.vector(ifelse(apply(this.wTS[,retcols], 1, max) < 0, 1, 0)) # all future n returns are negative
  this.wTS$meanret <- as.vector(apply(this.wTS[,retcols], 1 , mean))
  TSlist[[syms[i]]] <- this.wTS
  logrslist[[syms[i]]] <- this.wTS$logrs
}

# build table with colnames=weeks, rownames=symbols
m <- matrix(data= NA, nrow=length(syms), ncol=length(logrslist[[syms[1]]]),
            dimnames=list(syms,as.character(index(logrslist[[syms[1]]]))))
# create logrslist matrix
for (i in 1:length(syms)) {
  m[i,] <- logrslist[[i]]
}

# create percentile matrix
mp <- matrix(data= NA, nrow=length(syms), ncol=ncol(m),
             dimnames=list(syms, colnames(m)))

for (i in 1:ncol(mp)) {
  if(sum(is.na(m[,i])) > 0) {
    mp[,i] <- NA
  } else {
    this.ec <- ecdf(m[,i])
    mp[,i] <- sapply(X=m[,i], function(x) this.ec(x))
  }
}

# create overall matrix to monitor broad market behaviour
moverall <- matrix(data= NA, nrow=2, ncol=ncol(m),
                   dimnames=list(c("mean", "sd"), colnames(m)))
moverall["mean",] <- as.vector(apply(m,2,mean))
moverall["sd",] <- as.vector(apply(m,2,sd))


# append these calculations to the elements in TSlist
for (i in 1:length(syms)) {
  TSlist[[syms[i]]]$RSpct <- as.vector(mp[syms[i],])
  # add deltas of RSpct
  for (j in c(1,2,5)) {
    TSlist[[syms[i]]] <- cbind(TSlist[[syms[i]]], ROC(TSlist[[syms[i]]][,"RSpct"], j))
    colnames(TSlist[[syms[i]]])[ncol(TSlist[[syms[i]]])] <- paste0("RRSpct.", j)
  }
  # als append overall metrics
  TSlist[[syms[i]]]$market.mean <- as.vector(moverall["mean",])
  TSlist[[syms[i]]]$market.sd <- as.vector(moverall["sd",])
}


# now combine datasets to train and validation data set
set.seed(seed)
trainindex <- sample(1:length(syms), floor(length(syms)*3/5))
trainsyms <- syms[trainindex]
validationsyms <- syms[-trainindex]

# input features
cnames <- colnames(TSlist[[1]])
inp.f <- c("logrs", "RSpct", cnames[grep("^RR", cnames)], cnames[grep("^market", cnames)])

# output variable
out.v <- c("allpos")

returnFullTable <- function(syms, inp.f, out.v){
  retdf <- data.frame()
  for (i in 1:length(syms)) {
    df <- as.data.frame(TSlist[[syms[i]]][,c(inp.f, out.v)], 
                        row.names=paste0(as.character(index(TSlist[[syms[i]]])), ".", syms[[i]]))
    retdf <- rbind(retdf, df[complete.cases(df),])
  }
  return(retdf)
}

trainSet <- returnFullTable(trainsyms, inp.f, out.v)
validationSet <- returnFullTable(validationsyms, inp.f, out.v)

# shorten dimension of training data to reduce train time
shortenTrainingData <- function(full.tdf, rate){
  inTrain <- createDataPartition(full.tdf[,ncol(full.tdf)], p=1/rate)[[1]]
  return(full.tdf[inTrain,])
}

trainSet.s <- shortenTrainingData(trainSet, 75)
validationSet.s <- shortenTrainingData(validationSet, 20)

# now train it
numberOfCores <- detectCores()      # prepare for multi core execution
registerDoMC(cores=numberOfCores-1) # leave one core for the OS
fitControl <- trainControl(method = "cv", 
                           number = numberOfCores-1, 
                           allowParallel = TRUE,
                           returnData = TRUE,
                           savePredictions = FALSE,
                           returnResamp = "none")
fit <- train(allpos ~ ., data=trainSet.s, method="rf", trControl=fitControl)

out <- cbind(validationSet.s, predict(fit, validationSet.s))
colnames(out)[ncol(out)] <- "pred"

mean(out[out$pred > .6, out.v])
mean(out[out$pred > .5 & out$pred < .6, out.v])
mean(out[out$pred > .4 & out$pred < .5, out.v])
mean(out[out$pred > .3 & out$pred < .4, out.v])
mean(out[out$pred > .2 & out$pred < .3, out.v])

# train it (version 2)
trainSet.s.m <- as.matrix(trainSet.s)

fit.glm <- train(allpos ~ ., data=trainSet.s.m, method="glm")

out <- cbind(validationSet.s, predict(fit.glm, validationSet.s))
colnames(out)[ncol(out)] <- "pred"


# train it (version 3, use polynomials)
trainSet.s.m <- as.matrix(trainSet.s)
trainSet.s.m.poly <- cbind(do.call(poly, c(lapply(1:(ncol(trainSet.s.m)-1), function(x) trainSet.s.m[,x]), degree=2, raw=T)),
                           trainSet.s.m[,ncol(trainSet.s.m)])
colnames(trainSet.s.m.poly)[ncol(trainSet.s.m.poly)] <- "allpos"
trainSet.s.df.poly <- as.data.frame(trainSet.s.m.poly)
trainSet.s.df.poly[,"allpos"] <- factor(trainSet.s.df.poly[,"allpos"])

fit.glm.poly <- train(allpos ~ ., data=trainSet.s.df.poly, method="plr")

out <- cbind(validationSet.s, predict(fit.glm, validationSet.s))
colnames(out)[ncol(out)] <- "pred"


# now apply predict to weekly group of stocks and rank them
# we are using validationsyms
complete.weeks <- index(TSlist[[1]][complete.cases(TSlist[[1]])]) # these weeks contain complete cases
testset.list <- list()
for (i in 1:length(complete.weeks)) {
  testset <- data.frame()
  for (j in 1:length(validationsyms)) {
    this.row <- as.data.frame(TSlist[[j]][complete.weeks[i]])
    rownames(this.row) <- paste0(rownames(this.row), ".", validationsyms[j])
    testset <- rbind(testset, this.row)
  }
  testset.list[[as.character(complete.weeks[i])]] <- testset 
}


# create prediction rank matrix
mpr <- matrix(data= NA, nrow=length(validationsyms), ncol=length(testset.list),
              dimnames=list(validationsyms, names(testset.list)))

# now predict weekly set
for (i in 1:length(testset.list)) {
  mpr[,i] <- predict(fit, testset.list[[i]][,c(inp.f, out.v)])
}

dfmpr <- as.data.frame(mpr, row.names=rownames(mpr))



#####################################################################
####### for Excel inspection ########################################
# eliminate weeks with NA
m1 <- m[,!is.na(colSums(m))]

dfm <- as.data.frame(m1, row.names=rownames(m1))
write.xlsx(dfm, "RLSlog.xlsx", as.table=TRUE, row.names=TRUE)

# create rank matrix
m1r <- matrix(data= NA, nrow=length(syms), ncol=ncol(m1),
            dimnames=list(syms, colnames(m1)))

for (i in 1:ncol(m1r)) {
  m1r[,i] <- rank(-m1[,i], ties.method="average")
}

dfm1r <- as.data.frame(m1r, row.names=rownames(m1r))
write.xlsx(dfm1r, "RLS_rank.xlsx", as.table=TRUE, row.names=TRUE)


# create percentile matrix
m1p <- matrix(data= NA, nrow=length(syms), ncol=ncol(m1),
              dimnames=list(syms, colnames(m1)))

for (i in 1:ncol(m1p)) {
  this.ec <- ecdf(m1[,i])
  m1p[,i] <- sapply(X=m1[,i], function(x) this.ec(x))
}

dfm1p <- as.data.frame(m1p, row.names=rownames(m1p))
write.xlsx(dfm1p, "RLS_pct.xlsx", as.table=TRUE, row.names=TRUE)


dbDisconnect(con)
