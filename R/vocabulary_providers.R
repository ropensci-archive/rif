#' Vocabulary services - get providers
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
#' vocabulary_providers()
#' }

vocabulary_providers <- function(vocabulary = NULL, key = NULL, ...) {
  args <- nc(list(vocabulary = vocabulary, key = key_check(key)))
  nif_parse(
    nif_GET("vocabulary/providers.json", args, ...),
    TRUE
  )
}
