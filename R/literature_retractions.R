#' Search literature retractions
#'
#' @export
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @family literature
#' @examples \dontrun{
#' # get PMIDs for retracted articles
#' (out <- literature_retractions())
#' # then get info on some articles
#' literature_pmid(pmid = out[1])
#' }

literature_retractions <- function(...) {
  nif_parse(
    nif_GET(file.path(nifbase(), "literature/retractions"), NULL, accept_json(), ...), TRUE
  )[[1]]
}
