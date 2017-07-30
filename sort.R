library(geosphere)
places <- `names<-`(read.table('locs.txt',sep="\t",comment.char="") , c('lat','lng','anchorname') )

myloc <- cbind( -79.91624, 40.43997)
places$dist <- distHaversine(myloc,places[,c('lng','lat')], r=6378137) * 0.621371 / 1000

places$name <- gsub('.*#','',places$anchorname)

write.csv(places[order(places$dist),c('dist','lat','lng','name','anchorname')],'sorted.csv')
