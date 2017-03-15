#' Get articles by PMID
#'
#' @export
#' @param pmid One or more PMID's in a vector or list
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family literature
#' @examples \dontrun{
#' # get PMIDs for retracted articles
#' (out <- literature_retractions())
#' # then get info on some articles
#' literature_pmid(pmid = out[1])
#' literature_pmid(pmid = out[1:2])
#' literature_pmid(pmid = out[1:10])
#' }

literature_pmid <- function(pmid, ...) {
  args <- stats::setNames(as.list(pmid), rep("pmid", length(pmid)))
  nif_parse(
    nif_GET("literature/pmid", args, ...), FALSE
  )
}
