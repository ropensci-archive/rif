#' Summary endpoint
#'
#' @import httr jsonlite
#' @export
#'
#' @template args
#' @examples \dontrun{
#' out <- summary("cellular")
#' out$query
#' out$messages
#' out$result$literatureSummary
#' out$result$federationSummary$total
#' out$result$federationSummary$categories
#' head(out$result$federationSummary$results)
#'
#' head( summary("neuron")$result$federationSummary$results )
#' head( summary("neuron", expandSynonyms=FALSE)$result$federationSummary$results )
#' head( summary("neuron", expandAbbrevs=TRUE)$result$federationSummary$results )
#'
#' library("httr")
#' summary("cellular", config=verbose())
#' }

summary <- function(query, expandSynonyms=TRUE, expandAcronyms=FALSE,
  expandAbbrevs=FALSE, expandInferred=TRUE, ...){

  args <- nc(list(q=query, expandSynonyms=al(expandSynonyms), expandAcronyms=al(expandAcronyms),
                  expandAbbrevs=al(expandAbbrevs), expandInferred=al(expandInferred)))
  nif_parse(nif_GET(file.path(nifbase(), "summary.json"), args, ...), TRUE)
}
