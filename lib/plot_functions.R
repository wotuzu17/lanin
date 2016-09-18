library("ggplot2")

# global definitions
saveTo <- "/home/voellenk/lanin_workdir/plots"

# connect to database (keys are in secret file)
con <- dbConnect(MySQL(), user=lanindb$user, password=lanindb$password, dbname=lanindb$db, host=lanindb$host)

sym <- "SSRI"
OS <- getOS(con, sym)
ivcols <- names(OS)[grep("^iv", names(OS))]
timeframes <- unique(as.numeric(gsub("\\D*", "", ivcols)))
type <- sub("^iv\\d*", "", ivcols) # call, put, mean
days <- as.numeric(gsub("\\D*", "", ivcols))


for (i in 1:nrow(OS)) {
  IV <- as.vector(OS[i,ivcols])
  date <- index(OS[i,])
  ivdf <- data.frame(type, days, IV)
  
  p <- ggplot(ivdf, aes(x=days, y=IV, group=type)) + 
    geom_point(aes(colour = type)) +
    ylim(.2,.8) +
    ggtitle(paste("IV", sym, "@", date))
  ggsave(paste0(saveTo, "/", sym,"_",date,"_IV.png"), p)
}

