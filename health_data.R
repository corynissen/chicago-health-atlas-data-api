

run <- function(zip=NULL, json=TRUE){
  data_url <- "https://raw.github.com/smartchicago/chicago-atlas/master/db/import/chitrec-data.csv"
  dataFile <- tempfile()
  download.file(data_url, destfile=dataFile, method="curl")
  data <- read.csv(dataFile, stringsAsFactors=F)
  
  if(!is.null(zip)){
    if(zip %in% data$zipcode){
      data <- subset(data, zipcode==zip)
    }else{
      data <- data.frame(error="error: zip not found")
    }
  }

  if(tolower(json) %in% c(TRUE, "true", "t")){
    output <- toJSON(data)
  }else{
    output <- otable(as.data.frame(rbind(names(data),data)))
  }
  as.WebResult(output, cmd="raw")
}
