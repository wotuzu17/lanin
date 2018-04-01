# functions for preprocessing training/evaluation data sets

# adds polynomia for all columns in the table (use only for input features)
addPolynomia <- function(m, degree) {
  p <- do.call(poly, c(lapply(1:ncol(m), function(x) m[,x]), degree=degree, raw=T))
  return(p)
}

# pass df with input features and one column "y" as outcome variable
# "y" can be a factor variable
makePolynomiaTrainDf <- function(df, degree) {
  ypos <- which(colnames(df1) == "y") # column index with colname "y"
  polyinp <- addPolynomia(as.matrix(df[,-ypos]), degree)
  retvar <- cbind(as.data.frame(polyinp), df[,ypos])
  colnames(retvar)[ncol(retvar)] <- "y"
  return(retvar)
}