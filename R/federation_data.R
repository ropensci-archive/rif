#' Federation data
#'
#' @export
#'
#' @param id (character) A dataset id
#' @param strict (logical) Only consider more relevant columns.
#' Default: `FALSE`
#' @param subclassQuery	(character) An known ID to query with subclass
#' axiom entailment (include all subclasses in the search). This can be
#' combined with the "query" parameter.
#' @param highlight (logical) Highlight ...
#' @param sortField	(character) The field to sort by
#' @param sortAsc (logical) Sort ascending?
#' @param offset (integer) The result (row) to start on
#' @param count (integer) The number of results (rows) to return
#' @param project (character) The columns to project (all by default)
#' @param facet	(character) Facets specified like facetName:facetValue
#' @param filter (character) Filters specified like columnName:filterValue.
#' If the column is declared numeric then the filterValue can be a range
#' expression (ie: >24.3).
#' @param subclassFilter (character) Filter specified like columnName:parentId
#' where parentId is a known ID. All subclasses of parentID will be included
#' in the filter. This parameter may be combined with "filter".
#' @param includePrimaryData (logical) deprecated Should primary data be
#' included in addition to the view? Please use the exportType option instead.
#' @param exportType (character) The type of data to return: "display" (data
#' suitable for a user interface - includes HTML), "data" (just the raw data
#' used to include the view - may include more data than present in the view
#' but will not include markup) "all" (include both display and data columns)
#' @param orMultiFacets (logical) True if multiple facet values for the same
#' facet are specified in the query and should be ORed together. Defaults to
#' "AND"
#' @template args
#' @family federation
#'
#' @examples \dontrun{
#' out <- federation_data(id = "nlx_152871-2")
#' out$query
#' out$messages
#' out$result$resultCount
#' out$result$nifId
#' out$result$debugInfo
#' out$result$result
#' out$result$results
#'
#' federation_data(id = "nlx_152871-2", query = "TS23")
#'
#' federation_data("nlx_152871-2", verbose = TRUE)
#' }

federation_data <- function(id, query = NULL, strict = FALSE,
  subclassQuery = NULL, expandSynonyms = TRUE, expandAcronyms = FALSE,
  expandAbbrevs = FALSE, expandInferred = TRUE, highlight = FALSE,
  sortField = NULL, sortAsc = TRUE, offset = 0, count = 20, project = NULL,
  facet = NULL, filter = NULL, subclassFilter = NULL,
  includePrimaryData = FALSE, exportType = NULL, orMultiFacets = FALSE,
  key = NULL, ...) {

  args <- nc(
    list(
      q = query, strict = al(strict), subclassQuery = subclassQuery,
      expandSynonyms = al(expandSynonyms), expandAcronyms = al(expandAcronyms),
      expandAbbrevs = al(expandAbbrevs), expandInferred = al(expandInferred),
      highlight = al(highlight), sortField = sortField, sortAsc = al(sortAsc),
      offset = offset,
      count = count, project = project, facet = facet, filter = filter,
      subclassFilter = subclassFilter,
      includePrimaryData = al(includePrimaryData),
      exportType = exportType, orMultiFacets = al(orMultiFacets),
      key = key_check(key)))
  res <- nif_parse(
    nif_GET(paste0("federation/data/", paste0(id, ".json")), args, ...),
  FALSE)
  res$result$result <- parse_result(res$result$result)
  res$result$results <- parse_rows(res$result$results$row)
  res$query <- parse_meta(res$query)
  res
}

parse_to_df <- function(x) {
  (xxxxxx <- data.table::setDF(data.table::rbindlist(
    lapply(x, data.frame, stringsAsFactors = FALSE),
    use.names = TRUE, fill = TRUE
  )))
  tibble::as_tibble(xxxxxx)
}

parse_result <- function(x) move_col(parse_to_df(x), "Source")

parse_rows <- function(x){
  rows <- pluck(x, "data")
  out <- list()
  for (i in seq_along(rows)) {
    out[[i]] <- data.frame(row = paste0("row", i),
                           do.call("rbind.data.frame", rows[[i]]),
                           stringsAsFactors  =  FALSE)
  }
  tibble::as_tibble(
    data.table::setDF(data.table::rbindlist(out, use.names = TRUE,
                                            fill = TRUE))
  )
}

parse_meta <- function(x){
  claus <- x$clauses[[1]]
  claus[
    vapply(claus, function(x) is.null(x) || length(x) == 0, logical(1))] <- NA
  df <- data.frame(claus, stringsAsFactors = FALSE)
  op <- x$operator
  if (!is.null(op)) {
    cbind(df, data.frame(operator = op, stringsAsFactors = FALSE))
  } else {
    df
  }
}
