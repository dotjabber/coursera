complete <- function(directory, id = 1:332) {
  data <- matrix(nrow=0, ncol=2)
  colnames(data) <- c("id", "nobs")
  
  for(i in id) {
    portion <- read.csv(paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", collapse = "", sep=""))
    data <- rbind(data, c(
      i,
      sum(!is.na(portion[["sulfate"]]) & !is.na(portion[["nitrate"]]))
    ))
  }
  
  data.frame(data)
}