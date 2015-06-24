#' Vocabulary services - get providers
#'
#' @export
#'
#' @param vocabulary A vocabulary
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_providers()
#' }

vocabulary_providers <- function(vocabulary = NULL, ...) {
  args <- nc(list(vocabulary = vocabulary))
  nif_parse(
    nif_GET(file.path(nifbase(), "vocabulary/providers"), args, accept_json(), ...),
    TRUE
  )
}
