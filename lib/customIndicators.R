# library of custom indicators

# returns linear model coefficients of ordered returns
returnSlope <- function(TS, n=200, slash=.1) {
  TS <- cbind(TS, "d"=NA, "k"=NA, "dn"=NA, "up"=NA)
  ret <- ROC(Cl(TS))
  slashn <- floor(n*slash)
  for (i in n:nrow(TS)) {
    retw <- as.vector(ret[(i-n+1):i])            # return window
    ordretw <- retw[order(retw, na.last=NA)]   # ordered return window
    slordretw <- ordretw[slashn:(length(ordretw)-slashn)] # slashed ordered return window
    ind <- index(slordretw)
    normind <- ind/mean(ind)-1                 # normalized index from -1 to 1
    model <- lm(slordretw ~ normind)           # linear model
    TS[i, "d"] <- model$coefficients[1]        # 1=intercept
    TS[i, "k"] <- model$coefficients[2]        # 2=k
    TS[i, "dn"] <- quantile(ordretw[1:slashn],.25) # .25 quantile of slashed lower band
    TS[i, "up"] <- quantile(ordretw[(length(ordretw)-slashn):length(ordretw)],.75) # .75 quantile of slashed upper band
  }
  return(TS[,c("d", "k", "dn", "up")])
}