#' Query NIF data
#'
#' @export
#'
#' @template args
#' @family query
#'
#' @examples \dontrun{
#' rif_query_categories()
#'
#' library("httr")
#' rif_query_categories(config = verbose())
#' }

rif_query_categories <- function(...) {
  nif_parse(
    nif_GET(file.path(nifbase(), "query/categories"), NULL, accept_json(), ...),
    TRUE
  )
}
