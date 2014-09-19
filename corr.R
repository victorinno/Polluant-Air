corr <- function(directory, threshold = 0) {
  
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  setwd(directory)
  files <- list.files(path =getwd() )
  
  data <- NULL
  
  for(i in 1:length(files)){
    fileData <- read.csv(files[i], stringsAsFactors = FALSE)
    
    if(sum(complete.cases(fileData)) > threshold){
      
      fileData <- fileData[complete.cases(fileData),]
      if(is.null(data)){
        data <- cor(as.vector(fileData[,2]), as.vector(fileData[,3]))
      }else{
        data <- rbind(data, cor(as.vector(fileData[,2]), as.vector(fileData[,3])))
      }
    }
    
    
  }
  setwd("C:/Users/floriano.peixoto/Documents/Hospital/Air Pollution")
  data
  
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
}

cr <- corr("specdata", 400)
head(cr)