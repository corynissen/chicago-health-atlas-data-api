

run <- function(zipcode=NULL, json=TRUE){
  data_url <- "https://raw.github.com/smartchicago/chicago-atlas/master/db/import/chitrec-data.csv"
  dataFile <- tempfile()
  download.file(data_url, destfile=dataFile, method="curl")
  data <- read.csv(dataFile, stringsAsFactors=F)
  
  if(!is.null(zipcode) & zipcode %in% data$zipcode){
    data <- subset(data, zipcode==zipcode)
  }

  if(tolower(json) %in% c(TRUE, "true", "t")){
    output <- toJSON(data)
  }else{
    output <- otable(data)
  }
  as.WebResult(output, cmd="raw")
}
