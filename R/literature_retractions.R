#' Search literature retractions
#'
#' @export
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family literature
#' @examples \dontrun{
#' # get PMIDs for retracted articles
#' (out <- literature_retractions())
#' # then get info on some articles
#' literature_pmid(pmid = out[1])
#' }

literature_retractions <- function(key = NULL, ...) {
  nif_parse(
    nif_GET("literature/retractions.json", list(key = key_check(key)), ...), TRUE
  )[[1]]
}
