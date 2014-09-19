pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  setwd(directory)
  files <- list.files(path =getwd() )
  
  
  data <- NULL
  
  for(i in id){
    if(is.null(data)){
      data <- read.csv(file = files[i], stringsAsFactors = FALSE)
    }else{
      data <- rbind(data,read.csv(file = files[i], stringsAsFactors = FALSE))
    }
  }

  
  dataComplete <- data[complete.cases(data[pollutant]),]
  vec <- dataComplete[pollutant]
  meanData <- mean(vec[,1])
  
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  
  return(meanData)
  

}