complete <- function(directory, id=1:332) {
        files_list <- list.files(directory, full.names=TRUE)  
        tmp <- vector(mode = "list", length = length(files_full))
        ans1<-data.frame()
       a <- numeric()
      b <- numeric()
        for (i in id) {
            #    print("1st")
                a<-c(a,i)
       #         print(a)
                tmp[[i]] <- read.csv(files_full[[i]])
              
                z<-data.frame(tmp[i])
                row<- nrow(z)
             
                val<- 0
           
                for (j in 1:row) {
                        if(!is.na(z[j,2]) & !is.na(z[j,3])){
           
                                val<-val+1
                        }
                }

                b<-c(b,val)

        }
      data.frame(id = a,nobs= b, stringsAsFactors=TRUE)
        
}
