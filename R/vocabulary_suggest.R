#' Vocabulary services - Get suggestions for terms
#'
#' DOESN'T SEEM TO WORK
#'
#' @export
#'
#' @param query (character) Query terms
#' @param limit The number of candidates to return. Default: 20
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_suggest("cell")
#' }

vocabulary_suggest <- function(query, limit = 10, key = NULL, ...) {
  args <- nc(list(q = query, limit = limit, key = key_check(key)))
  nif_parse(
    nif_GET("vocabulary/suggest.json", args, ...),
    TRUE
  )
}
