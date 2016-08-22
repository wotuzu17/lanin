#!/usr/bin/Rscript --vanilla
# Script downloads files from historicaloptiondata.com
# the keys optiondata_user und optiondata_password are stored in the file .keys.R in my home dir
Sys.setenv(TZ="UTC")
scriptname <- "nightlyRun_downloadFiles.R" # for logging

start.time <- Sys.time()
cat (paste(start.time, scriptname, "started\n"))

# global definitions
source("/home/voellenk/.keys.R")   # secret key file
url <- "ftp://l3.deltaneutral.com"
storageDir <- "/home/voellenk/lanin_workdir/storage"

suppressPackageStartupMessages(library(optparse)) # 
suppressPackageStartupMessages(library(bitops))   # required by RCurl
suppressPackageStartupMessages(library(RCurl))    # to download from ftp server

option_list <- list(
  make_option(c("--downloadFiles"), type="integer", default=5,
              help="number of most recent files to download [default %default]",
              metavar="number")
  #make_option(c("-v", "--verbose"), action="store_true", default=TRUE,
  #            help="Print extra output [default]"),
)

opt <- parse_args(OptionParser(option_list=option_list))
args <- commandArgs(trailingOnly=TRUE)

# create storage dir if not exists
if (!dir.exists(storageDir)) {
  cat (paste(Sys.time(), "create storage dir:", storageDir, "\n"))
  dir.create(storageDir, recursive = TRUE)
}

# create subdir with start.date as dirname, to download the files to
this.downloaddir <- paste(storageDir, gsub(" ", "_",as.character(start.time)), sep="/")
if (!dir.exists(this.downloaddir)) {
  cat (paste(Sys.time(), "create download dir for this run:", this.downloaddir, "\n"))
  dir.create(this.downloaddir, recursive = TRUE)
}

# getURL delivers 1 string of all files on the ftp server
filesOnFtpString <- getURL(url, 
                     userpwd=paste(optiondata_user, optiondata_password, sep=":"),
                     dirlistonly = TRUE)

# explode filenames
filesOnFTP <- strsplit(filesOnFtpString, "\r*\n")[[1]]

# define most recent files to download
filesToDownload <- filesOnFTP[order(filesOnFTP, decreasing=TRUE)][1:opt$downloadFiles]

for (file in filesToDownload) {
  cat (paste(Sys.time(), "Downloading file", file))
  bin <- getBinaryURL(paste(url, file, sep="/"), 
         userpwd=paste(optiondata_user, optiondata_password, sep=":"))
  cat (" ...done, writing to", paste(this.downloaddir, file, sep="/"), "\n")
  writeBin(bin, paste(this.downloaddir, file, sep="/"))
}

stop.time <- Sys.time()
cat (paste(stop.time, scriptname, "stopped, duration:", round(as.numeric(difftime(stop.time, start.time, units="mins")),1), "mins\n"))
cat ("----------------------------------------------------------------------\n")

