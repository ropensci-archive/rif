#' Vocabulary services - get terms that match a prefix
#'
#' @export
#'
#' @param prefix,id (character) The prefix, or id of the term. Use one or
#' the other
#' @param limit The number of candidates to return. Default: 20
#' @param category A category
#' @param vocabulary A vocabulary
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary(prefix = "cell")
#' vocabulary(prefix = "cell", limit = 4)
#' vocabulary(prefix = "axon")
#' vocabulary(id = "GO_0022407")
#' }

vocabulary <- function(prefix = NULL, id = NULL, limit = 20,
                       category = NULL, vocabulary = NULL, key = NULL, ...) {

  if (!xor(is.null(prefix), is.null(id))) {
    stop("Provide only one of prefix or id", call. = FALSE)
  }
  args <- nc(list(prefix = prefix, limit = limit, category = category,
                  vocabulary = vocabulary, key = key_check(key)))
  route <- if (is.null(id)) {
    "vocabulary.json"
  } else {
    file.path("vocabulary", paste0(id, ".json"))
  }
  tibble::as_tibble(nif_parse(nif_GET(route, args, ...), TRUE))
}
