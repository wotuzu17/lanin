# knit training report
k.remark <- "knit for advance/decline classes"
knit2html("/home/voellenk/lanin_workdir/lanin/training/TrainReport_k1.Rmd",
          paste0(knitrReportDir, "/", format(start.time, "%Y-%m-%d_%H-%M"), 
                 "_x_", opt$xversion,
                 "_y_", opt$yversion,
                 "_a_", opt$aversion,
                 "_k_", opt$kversion,            
                 "_r_", opt$rate,
                 "_seed_", opt$seed,
                 ".html"))


# store fit models and confusion matrices for further inspection
save(cm, file=paste0(trainDataDir, "/", format(start.time, "%Y-%m-%d_%H-%M"), 
                     "_x_", opt$xversion,
                     "_y_", opt$yversion,
                     "_a_", opt$aversion,
                     "_k_", opt$kversion,    
                     "_r_", opt$rate,
                     "_seed_", opt$seed,
                     ".RData"))