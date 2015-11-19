corr <- function(directory, threshold = 0) {
  data <- numeric()

  for(i in 1:332) {
    portion <- read.csv(paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", collapse = "", sep=""))
    portion <- portion[complete.cases(portion), ]
    
    if(nrow(portion) > threshold) {
      data <- append(data, c(
        cor(x=portion[["sulfate"]], y=portion[["nitrate"]])
      ))
    }
  }
  
  data
}