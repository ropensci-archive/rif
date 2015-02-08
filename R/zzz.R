nifbase <- function() "http://nif-services.neuinfo.org/servicesv1/v1"

nc <- function (l) Filter(Negate(is.null), l)

nif_GET <- function(url, args, ...){
  res <- GET(url, query=args, ...)
  stop_for_status(res)
  content(res, "text")
}

nif_parse <- function(x, simplify=FALSE){
  jsonlite::fromJSON(x, simplify)
}

al <- function(x){
  if(x)
    'true'
  else
    'false'
}
