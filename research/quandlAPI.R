# test quandl API
# the API key is in the ~/.lanindb.R file

library(Quandl)
library(xts)
source("/home/voellenk/.lanindb.R")     # secret key file

Quandl.api_key(quandlAPIkey)

var <- Quandl.datatable('WIKI/PRICES', ticker='')
Quandl.datatable('WIKI/CODES')
