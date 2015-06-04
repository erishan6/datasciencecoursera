best<- function(state, outcome) {
        data<-read.csv("outcome-of-care-measures.csv")
        Statedata <- data [grep(state,data$State),]
        col1<-1
        if (outcome %in% "heart attack") {
                col1<-11
        }
        else if (outcome %in% "heart failure") {
               col1<- 17
        }
        else if (outcome %in% "pneumonia") {
                col1<-23
        }
        
        Statedata[,col1] <- suppressWarnings(as.numeric(levels(Statedata[,col1])[Statedata[,col1]]))
        orderdata <- Statedata[order(Statedata[,col1],Statedata[,2]),]
         
      #  print(orderdata[,col1])
        ans<- as.character(orderdata[1,2])
             if (is.na(ans)) {
                     stop("invalid state" )       
             }
                else if (col1 == 1){
                        stop("invalid outcome" )   
                        
              }
        ans
}
