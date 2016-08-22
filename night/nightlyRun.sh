#!/bin/bash
# This script executes all Rscripts to download and process EOD option data
# it is usually started by the crond at midnight

logdir="/home/voellenk/.laninlog"

# create log directory if not exists
mkdir -p $logdir

# retrieve current data from ftp server
echo -e "\nretrieving quotes from ftp."
./Rscript/nightlyRun_downloadFiles.R  >> $logdir/nightlyRun_downloadFiles.R.log

