#' Federation search
#'
#' @export
#' @param strict (logical) Only consider more relevant columns.
#' Default: `FALSE`
#' @param snippetCount How many snippets to return. Default: 0
#' @template args
#' @family federation
#'
#' @examples \dontrun{
#' out <- federation_search("cellular")
#' out$query
#' out$messages
#' out$result$total
#' out$result$categories
#' head(out$result$results)
#'
#' head( federation_search("cellular")$result$results )
#' head( federation_search("cellular", strict=TRUE)$result$results )
#' federation_search("cellular", snippetCount=3)
#'
#' federation_search("cellular", verbose = TRUE)
#' }

federation_search <- function(query, strict=FALSE, snippetCount=0,
  expandSynonyms=TRUE, expandAcronyms=FALSE, expandAbbrevs=FALSE,
  expandInferred=TRUE, ...) {

  args <- nc(list(q=query, strict=strict, snippetCount=snippetCount,
                  expandSynonyms=al(expandSynonyms),
                  expandAcronyms=al(expandAcronyms),
                  expandAbbrevs=al(expandAbbrevs),
                  expandInferred=al(expandInferred)))
  nif_parse(nif_GET("federation/search.json", args, ...), TRUE)
}
