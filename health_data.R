

run <- function(zip=NULL, json=TRUE){
  data_url <- "https://raw.github.com/smartchicago/chicago-atlas/master/db/import/chitrec-data.csv"
  dataFile <- tempfile()
  download.file(data_url, destfile=dataFile, method="curl")
  data <- read.csv(dataFile, stringsAsFactors=F)
  
  if(!is.null(zip) & zip %in% data$zipcode){
    data <- subset(data, zipcode==zip)
  }

  if(tolower(json) %in% c(TRUE, "true", "t")){
    output <- toJSON(data)
  }else{
    output <- otable(as.data.frame(cbind(names(data),data)))
  }
  as.WebResult(output, cmd="raw")
}
