complete <- function(directory, id = 1:332) {
  
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  setwd(directory)
  files <- list.files(path =getwd() )
  
  data <- NULL
  
  for(i in id){
    fileData <- read.csv(files[i], stringsAsFactors = FALSE)
    if(is.null(data)){
      data <- data.frame(i,sum(complete.cases(fileData)))  
    }else{
      data <- rbind(data,data.frame(i,sum(complete.cases(fileData))))
    }
  }
  
  names(data) <- c("id", "nobs")
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  return(data)
}