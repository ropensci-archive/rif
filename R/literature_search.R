#' Literature search
#'
#' @export
#'
#' @param offset (integer) The result (row) to start on
#' @param count (integer) The number of results (rows) to return. Default: 20
#' @param minDate The minimum date (a unix time value - milliseconds
#' since 1970)
#' @param maxDate The maximum date (a unix time value - milliseconds
#' since 1970)
#' @param facetCount  The facet count. Default: 0
#' @param snippetCount  The snippet count. Default: 0
#' @param minMatch  The Solr minmatch percentage. Default: 60 percent
#' @param searchFullText  Should full text be included in the search?
#' Default: `FALSE`
#' @param requireFullText Should only full text be included in the search?
#' Default: `FALSE`
#' @param authorFilter  Author filters
#' @param yearFilter  Year filters
#' @param journalFilter Journal filters
#' @param sort  Use "date" to sort by date. Otherwise relevancy will be used.
#' @param section Sections to search
#' @param highlight (no documentation provided). Default: `FALSE`
#' @param abstract  (no documentation provided). Default: `TRUE`
#' @template args
#' @keywords family
#'
#' @examples \dontrun{
#' out <- literature_search(query = "cellular")
#' out$result$publications
#' out$result$facets
#' out$query
#'
#' literature_search(query = "ecology")
#' literature_search(query = "ecology", searchFullText = FALSE)
#' literature_search(query = "ecology", searchFullText = TRUE)
#' literature_search(query = "ecology", requireFullText = TRUE)
#' }

literature_search <- function(query, offset = 0, count = 20, minDate = NULL,
  maxDate = NULL, facetCount = 0, snippetCount = 0, minMatch = 60,
  searchFullText = FALSE, requireFullText = FALSE, authorFilter = NULL,
  yearFilter = NULL, journalFilter = NULL, sort = NULL, section = NULL,
  expandSynonyms = TRUE, expandAcronyms = FALSE, expandAbbrevs = FALSE,
  expandInferred = TRUE, highlight = FALSE, abstract = TRUE, key = NULL, ...) {

  args <- nc(list(q = query, offset = offset, count = count, minDate = minDate,
    maxDate = maxDate, facetCount = facetCount, snippetCount = snippetCount,
    minMatch = minMatch, searchFullText = al(searchFullText),
    requireFullText = al(requireFullText), authorFilter = authorFilter,
    yearFilter = yearFilter, journalFilter = journalFilter, sort = sort,
    section = section, expandSynonyms = al(expandSynonyms),
    expandAcronyms = al(expandAcronyms), expandAbbrevs = al(expandAbbrevs),
    expandInferred = al(expandInferred), highlight = highlight,
    abstract = abstract, key = key_check(key)))
  res <- nif_parse(
    nif_GET("literature/search.json", args, ...),
    TRUE)
  res$result$publications <- tibble::as_tibble(res$result$publications)
  return(res)
}
