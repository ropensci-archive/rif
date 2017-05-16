#' Vocabulary services - get categories
#'
#' @export
#'
#' @param vocabulary A vocabulary
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_categories()
#' }

vocabulary_categories <- function(vocabulary = NULL, key = NULL, ...) {
  args <- nc(list(vocabulary = vocabulary, key = key_check(key)))
  nif_parse(
    nif_GET("vocabulary/categories.json", args, ...),
    TRUE
  )
}
