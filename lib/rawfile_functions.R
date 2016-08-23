# scripts returns a list of 3 elements: 
# optionstats, options and stockquotes
# of a given zip file, passed as full path
# reading of a file may take some seconds and requires memory
extractRawFile <- function(file, read=c("ALL")) {
  res <- list()
  csvfiles <- unzip(file, list=TRUE)
  if (read == "ALL") {
    for (csvfile in csvfiles$Name) {
      name <- sub("_.*$", "", sub("^L3_", "", csvfile)) # optionstats, options or stockquotes
      res[[name]] <- read.csv(unz(file, csvfile), stringsAsFactors = FALSE)
    }    
  } else if ("optionstats" %in% read) {
    csvfile <- csvfiles$Name[grep("optionstats_", csvfiles$Name)]
    res[["optionstats"]] <- read.csv(unz(file, csvfile), stringsAsFactors = FALSE)
  } else if ("stockquotes" %in% read) {
    csvfile <- csvfiles$Name[grep("stockquotes_", csvfiles$Name)]
    res[["stockquotes"]] <- read.csv(unz(file, csvfile), stringsAsFactors = FALSE)
  } else if ("options" %in% read) {
    csvfile <- csvfiles$Name[grep("options_", csvfiles$Name)]
    res[["options"]] <- read.csv(unz(file, csvfile), stringsAsFactors = FALSE)
  }
  return(res)
}

# covert 2/20/2016 into 2016-2-20
# to convert the date columns in the rawfile for feeding to mysql db
dateconvert <- function(datevec) {
  month <- sub("/.*", "", datevec)
  day <- sub("/.*", "", sub("^\\d*/", "", datevec))
  year <- sub("^.*/", "", datevec)
  return(sprintf("%s-%s-%s", year, month, day))
}

