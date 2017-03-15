#' Summary
#'
#' @export
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
#' head(
#'  rif_summary("neuron", expandSynonyms=FALSE)$result$federationSummary$results
#' )
#' head(
#'  rif_summary("neuron", expandAbbrevs=TRUE)$result$federationSummary$results
#' )
#'
#' rif_summary("cellular", verbose = TRUE)
#' }

rif_summary <- function(query, expandSynonyms=TRUE, expandAcronyms=FALSE,
  expandAbbrevs=FALSE, expandInferred=TRUE, ...){

  args <- nc(list(q = query, expandSynonyms = al(expandSynonyms),
                  expandAcronyms = al(expandAcronyms),
                  expandAbbrevs = al(expandAbbrevs),
                  expandInferred = al(expandInferred)))
  nif_parse(nif_GET("summary.json", args, ...), TRUE)
}
