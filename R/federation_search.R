#' Summary endpoint
#'
#' @export
#' @param strict (logical) Only consider more relevant columns. Default: \code{FALSE}
#' @param snippetCount How many snippets to return. Default: 0
#' @template args
#'
#' @examples \dontrun{
#' out <- federation_search("cellular")
#' out$query
#' out$messages
#' out$result$literatureSummary
#' out$result$federationSummary$total
#' out$result$federationSummary$categories
#' head(out$result$federationSummary$results)
#'
#' head( summary("cellular")$result$federationSummary$results )
#' head( summary("cellular", expandSynonyms=FALSE)$result$federationSummary$results )
#' head( summary("cellular", expandAbbrevs=TRUE)$result$federationSummary$results )
#'
#' library("httr")
#' summary("cellular", config=verbose())
#' }

federation_search <- function(query, strict=FALSE, snippetCount=0, expandSynonyms=TRUE,
  expandAcronyms=FALSE, expandAbbrevs=FALSE, expandInferred=TRUE, ...){

  args <- nc(list(q=query, strict=strict, snippetCount=snippetCount,
                  expandSynonyms=al(expandSynonyms), expandAcronyms=al(expandAcronyms),
                  expandAbbrevs=al(expandAbbrevs), expandInferred=al(expandInferred)))
  nif_parse(nif_GET(file.path(nifbase(), "federation/search.json"), args, ...), TRUE)
}
