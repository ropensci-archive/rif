#' Query NIF data
#'
#' @export
#'
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family query
#'
#' @examples \dontrun{
#' rif_query_categories()
#' rif_query_categories(verbose = TRUE)
#' }

rif_query_categories <- function(...) {
  nif_parse(
    nif_GET("query/categories", NULL, ...),
    TRUE
  )
}
