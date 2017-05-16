#' Query NIF data
#'
#' @export
#'
#' @template args
#' @family query
#'
#' @examples \dontrun{
#' rif_query(query = "anatomy")
#'
#' rif_query("cellular", verbose = TRUE)
#' }

rif_query <- function(query, expandSynonyms = TRUE, expandAcronyms = FALSE,
                      expandAbbrevs = FALSE, expandInferred = TRUE,
                      key = NULL, ...) {

  args <- nc(list(q = query, expandSynonyms = al(expandSynonyms),
                  expandAcronyms = al(expandAcronyms),
                  expandAbbrevs = al(expandAbbrevs),
                  expandInferred = al(expandInferred), key = key_check(key)))
  nif_parse(
    nif_GET("query.json", args, ...),
    FALSE
  )
}
