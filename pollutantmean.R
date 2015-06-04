pollutantmean <- function(directory,pollutant="sulfate", id=1:332)  {
        
        files_list <- list.files(directory, full.names=TRUE)  
        tmp <- vector(mode = "list", length = length(files_full))
        output <- data.frame()
      
        for (i in id) {
                tmp[[i]] <- read.csv(files_full[[i]])
        }

        output <- do.call(rbind, tmp)
        dat_subset <- output[which(output[, "ID"] %in% id),]
        k<-mean(dat_subset[,pollutant], na.rm=TRUE)
           signif(k, digits=4)    
}
