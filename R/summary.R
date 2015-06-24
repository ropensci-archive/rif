#' Summary
#'
#' @importFrom httr GET content stop_for_status accept_json
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @template args
#' @examples \dontrun{
#' out <- rif_summary("cellular")
#' out$query
#' out$messages
#' out$result$literatureSummary
#' out$result$federationSummary$total
#' out$result$federationSummary$categories
#' head(out$result$federationSummary$results)
#'
#' head( rif_summary("neuron")$result$federationSummary$results )
#' head( rif_summary("neuron", expandSynonyms=FALSE)$result$federationSummary$results )
#' head( rif_summary("neuron", expandAbbrevs=TRUE)$result$federationSummary$results )
#'
#' library("httr")
#' rif_summary("cellular", config=verbose())
#' }

rif_summary <- function(query, expandSynonyms=TRUE, expandAcronyms=FALSE,
  expandAbbrevs=FALSE, expandInferred=TRUE, ...){

  args <- nc(list(q = query, expandSynonyms = al(expandSynonyms), expandAcronyms = al(expandAcronyms),
                  expandAbbrevs = al(expandAbbrevs), expandInferred = al(expandInferred)))
  nif_parse(nif_GET(file.path(nifbase(), "summary.json"), args, ...), TRUE)
}
