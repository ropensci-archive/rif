#' Federation facets
#'
#' @export
#'
#' @param id (character) A dataset id
#' @param strict (logical) Only consider more relevant columns.
#' Default: `FALSE`
#' @param subclassQuery	(character) An known ID to query with subclass axiom
#' entailment (include all subclasses in the search). This can be combined
#' with the "query" parameter.
#' @param offset (integer) The result (row) to start on	query	0
#' @param count (integer) The number of results (rows) to return. Default: 20
#' @param minCount (integer) The minimum count result to return. Default: 2
#' @param facet	(character) Facets specified like facetName:facetValue	query
#' @param filter (character) Filters specified like columnName:filterValue. If
#' the column is declared numeric then the filterValue can be a range
#' expression (ie: >24.3)
#' @param orMultiFacets (logical) True if multiple facet values for the same
#' facet are specified in the query and should be ORed together. Defaults
#' to "AND"
#' @param subclassFilters (character) Filter specified like
#' columnName:parentId where parentId is a known ID. All subclasses of
#' parentID will be included in the filter. This parameter may be
#' combined with "filter".
#' @template args
#' @family federation
#'
#' @examples \dontrun{
#' out <- federation_facet(id = "nlx_152871-2")
#' out$category
#' out$facets
#'
#' out <- federation_facet(id = "nlx_152871-2", count = 100)
#' out$category
#' out$facets
#'
#' federation_facet(id = "nlx_152871-2", count = 100, minCount = 10)
#' }

federation_facet <- function(id, query = NULL, strict = FALSE,
  subclassQuery = NULL, expandSynonyms = TRUE, expandAcronyms = FALSE,
  expandAbbrevs = FALSE, expandInferred = TRUE, offset = 0, count = 20,
  minCount = 2, facet = NULL, filter = NULL, orMultiFacets = FALSE,
  subclassFilters = NULL, key = NULL, ...) {

  args <- nc(
    list(
      q = query, strict = al(strict), subclassQuery = subclassQuery,
      expandSynonyms = al(expandSynonyms), expandAcronyms = al(expandAcronyms),
      expandAbbrevs = al(expandAbbrevs), expandInferred = al(expandInferred),
      offset = offset, count = count, facet = facet, filter = filter,
      orMultiFacets = al(orMultiFacets), subclassFilters = subclassFilters,
      key = key_check(key)))
  res <- nif_parse(
    nif_GET(paste0("federation/facets/", paste0(id, ".json")), args, ...),
    FALSE)
  list(category = res[[1]]$category, facets = parse_to_df(res[[1]]$facets))
}
