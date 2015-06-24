#' Get articles by PMID
#'
#' @export
#' @param pmid One or more PMID's in a vector or list
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @keywords literature
#' @examples \dontrun{
#' # get PMIDs for retracted articles
#' (out <- literature_retractions())
#' # then get info on some articles
#' literature_pmid(pmid = out[1])
#' literature_pmid(pmid = out[1:2])
#' literature_pmid(pmid = out[1:10])
#' }

literature_pmid <- function(pmid, ...) {
  args <- setNames(as.list(pmid), rep("pmid", length(pmid)))
  nif_parse(
    nif_GET(file.path(nifbase(), "literature/pmid"), args, accept_json()), FALSE
  )
}
