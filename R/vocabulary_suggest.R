#' Vocabulary services - Get suggestions for terms
#'
#' DOESN'T SEEM TO WORK
#'
#' @export
#'
#' @param query (character) Query terms
#' @param limit The number of candidates to return. Default: 20
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_suggest("cell")
#' }

vocabulary_suggest <- function(query, limit = 10, ...) {
  args <- nc(list(q = query, limit = limit))
  nif_parse(
    nif_GET(file.path(nifbase(), "vocabulary/suggest"), args, accept_json(), ...),
    TRUE
  )
}
