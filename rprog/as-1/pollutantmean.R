pollutantmean <- function(directory, pollutant, id = 1:332) {
  data <- data.frame(Date = as.Date(character()), sulfate = numeric(), nitrate = numeric(), ID = integer())
  
  for(i in id) {
    portion <- read.csv(paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", collapse = "", sep=""))
    data <- rbind(data, portion)
  }
  
  mean(data[[pollutant]], na.rm = TRUE)
}