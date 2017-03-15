#' Lexical services - break Pubmed documents into entities
#'
#' @export
#'
#' @param pmid One or more PMID's in a vector or list
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family lexical
#'
#' @examples \dontrun{
#' out <- literature_retractions()
#' lexical_pmentities(out[1:3])
#' }

lexical_pmentities <- function(pmid, ...) {
  args <- stats::setNames(as.list(pmid), rep("pmid", length(pmid)))
  start_end(nif_parse(
    nif_GET("lexical/pmEntities", args, ...),
    TRUE
  ))
}
