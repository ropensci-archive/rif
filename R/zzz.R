nifbase <- function() "http://nif-services.neuinfo.org"

nc <- function(l) Filter(Negate(is.null), l)

nif_GET <- function(path, args, ...){
  cli <- crul::HttpClient$new(
    url = nifbase(),
    headers = list(Accept = "application/json")
  )
  res <- cli$get(path = file.path("servicesv1/v1", path), query = args, ...)
  res$raise_for_status()
  res$parse("UTF-8")
}

nif_parse <- function(x, simplify=FALSE){
  jsonlite::fromJSON(x, simplify, flatten = TRUE)
}

al <- function(x) {
  if (is.null(x)) {
    NULL
  } else {
    if (x) {
      'true'
    } else {
      'false'
    }
  }
}

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

move_col <- function(x, y, to = "start"){
  x[ c(names(x)[-grep(y, names(x))], y) ]
}

start_end <- function(x) {
  x[, c("token", "start", "end")]
}
