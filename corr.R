corr <- function(directory, threshold = 0) {
        files_list <- list.files(directory, full.names=TRUE)  
        tmp <- vector(mode = "list", length = length(files_full))
        ans1<-data.frame()
        sul <- numeric()
        nit <- numeric()
        ans <-numeric(0)
        
        output <- data.frame()
        
#        for (i in 1:332) {
#                tmp[[i]] <- read.csv(files_full[[i]])
#        }
                
        for (i in 1:332) {
                tmp[[i]] <- read.csv(files_full[[i]])
                z<-data.frame(tmp[i])
                row<- nrow(z)
                val<- 0
                for (j in 1:row) {
                        if(!is.na(z[j,2]) & !is.na(z[j,3])){
                               val<-val+1
                                sul<- c(sul,z[j,2])
                                nit<-c(nit, z[j,3])
                        }
                }
                if (threshold <= val) {
                        output <- do.call(rbind, tmp[i])
                        
                        ans<-c(ans, cor(output[,"sulfate"],output[,"nitrate"],use = "na.or.complete"))       
                }
        }
#        output <- do.call(rbind, tmp)
        if (length(output)== 0) {
                ans<-0
        }else {
                ans#<-cor(output[,"sulfate"],output[,"nitrate"],use = "na.or.complete")       
        }
        signif(ans, digits=4)
}
