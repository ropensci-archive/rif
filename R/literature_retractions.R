#' Search literature retractions
#'
#' @export
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family literature
#' @examples \dontrun{
#' # get PMIDs for retracted articles
#' (out <- literature_retractions())
#' # then get info on some articles
#' literature_pmid(pmid = out[1])
#' }

literature_retractions <- function(...) {
  nif_parse(
    nif_GET("literature/retractions", NULL, ...), TRUE
  )[[1]]
}
