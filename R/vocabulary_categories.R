#' Vocabulary services - get categories
#'
#' @export
#'
#' @param vocabulary A vocabulary
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family vocabulary
#'
#' @examples \dontrun{
#' vocabulary_categories()
#' }

vocabulary_categories <- function(vocabulary = NULL, ...) {
  args <- nc(list(vocabulary = vocabulary))
  nif_parse(
    nif_GET("vocabulary/categories", args, ...),
    TRUE
  )
}
