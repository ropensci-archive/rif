#' Vocabulary services - Search for vocabulary terms and their metadata
#'
#' @export
#'
#' @param term (character) The search terms
#' @param limit The number of candidates to return. Default: 20
#' @param category A category
#' @param vocabulary A vocabulary
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_search("cell")
#' vocabulary_search("cell", limit = 3)
#' vocabulary_search("cell", category = "biological_process")
#' }

vocabulary_search <- function(term, limit = 20, category = NULL,
                              vocabulary = NULL, key = NULL, ...) {

  args <- nc(list(term = term, limit = limit, category = category,
                  vocabulary = vocabulary, key = key_check(key)))
  nif_parse(
    nif_GET("vocabulary/search.json", args, ...),
    TRUE
  )
}
