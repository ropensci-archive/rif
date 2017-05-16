#' Lexical services - break into chunks
#'
#' @export
#'
#' @param text (character) The source text
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family lexical
#'
#' @examples \dontrun{
#' text <- "Lorem ipsum inceptos dolor nisi torquent porttitor donec,
#' blandit scelerisque mattis cras quis mi, aliquam sagittis. Convallis
#' placerat commodo imperdiet varius nunc tempus urna vitae ultrices tristique
#' eu mi ornare velit donec, posuere laoreet pretium vitae porta augue porta
#' feugiat in sapien egestas. Quam odio nullam pulvinar litora curabitur amet
#' lacus sociosqu gravida ligula molestie dui netus fusce bibendum scelerisque,
#' dictum malesuada proin elit etiam aliquam, mattis euismod donec
#' nisl facilisis."
#'
#' lexical_chunks(gsub("\n", "", text))
#' }

lexical_chunks <- function(text, key = NULL, ...) {
  start_end(nif_parse(
    nif_GET("lexical/chunks.json", list(text = text, key = key_check(key)), ...),
    TRUE
  ))
}
