#nifbase <- function() "https://neuinfo.org"
nifbase <- function() "https://scicrunch.org"

nc <- function(l) Filter(Negate(is.null), l)

nif_GET <- function(path, args, ...){
  cli <- crul::HttpClient$new(
    url = nifbase(),
    headers = list(Accept = "application/json")
  )
  res <- cli$get(path = file.path("api/1/dataservices", path), query = args, ...)
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

key_check <- function(x) {
  tmp <- if (is.null(x)) Sys.getenv("NIF_API_KEY", "") else x
  if (tmp == "") {
    getOption("nif_api_key", stop("need an API key for DPLA",
                                   call. = FALSE))
  } else {
    tmp
  }
}
