#' Query NIF data
#'
#' @export
#'
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family query
#'
#' @examples \dontrun{
#' rif_query_categories()
#' rif_query_categories(verbose = TRUE)
#' }

rif_query_categories <- function(key = NULL, ...) {
  nif_parse(
    nif_GET("query/categories.json", list(key = key_check(key)), ...),
    TRUE
  )
}
