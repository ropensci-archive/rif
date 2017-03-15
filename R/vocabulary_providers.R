#' Vocabulary services - get providers
#'
#' @export
#'
#' @param vocabulary A vocabulary
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_providers()
#' }

vocabulary_providers <- function(vocabulary = NULL, ...) {
  args <- nc(list(vocabulary = vocabulary))
  nif_parse(
    nif_GET("vocabulary/providers", args, ...),
    TRUE
  )
}
