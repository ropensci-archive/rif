#' Lexical services - extract POS tags from input text
#'
#' @export
#'
#' @param text (character) The source text
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family lexical
#'
#' @examples \dontrun{
#' text <- "Lorem ipsum inceptos dolor nisi torquent porttitor donec, blandit
#' scelerisque mattis cras quis mi, aliquam sagittis. Convallis placerat
#' commodo imperdiet varius nunc tempus urna vitae ultrices tristique eu mi
#' ornare velit donec, posuere laoreet pretium vitae porta augue porta feugiat
#' in sapien egestas. Quam odio nullam pulvinar litora curabitur amet lacus
#' sociosqu gravida ligula molestie dui netus fusce bibendum scelerisque,
#' dictum malesuada proin elit etiam aliquam, mattis euismod donec
#' nisl facilisis."
#'
#' lexical_pos(gsub("\n", "", text))
#' }

lexical_pos <- function(text, ...) {
  start_end(nif_parse(
    nif_GET("lexical/pos", list(text = text), ...),
    TRUE
  ))
}
