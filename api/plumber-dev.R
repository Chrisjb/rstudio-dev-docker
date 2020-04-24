# plumber.R 


#' @filter cors
cors <- function(req, res) {
   
   res$setHeader("Access-Control-Allow-Origin", "*")
   
   if (req$REQUEST_METHOD == "OPTIONS") {
      res$setHeader("Access-Control-Allow-Methods","*")
      res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
      res$status <- 200 
      return(list())
   } else {
      plumber::forward()
   }
   
}


#* @get /api/test
test <- function(x, y){ 
   tryCatch({
      x <- as.numeric(x)
      y <- as.numeric(y)
      return(x + y)
   }, error = function(err){
      msg <- paste0(err)
      list(error=jsonlite::unbox(msg))
      
   })

}
