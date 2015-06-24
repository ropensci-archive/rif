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
#' library("httr")
#' rif_query("cellular", config = verbose())
#' }

rif_query <- function(query, expandSynonyms = TRUE, expandAcronyms = FALSE,
                      expandAbbrevs = FALSE, expandInferred = TRUE, ...) {

  args <- nc(list(q = query, expandSynonyms = al(expandSynonyms),
                  expandAcronyms = al(expandAcronyms), expandAbbrevs = al(expandAbbrevs),
                  expandInferred = al(expandInferred)))
  nif_parse(
    nif_GET(file.path(nifbase(), "query"), args, accept_json(), ...),
    FALSE
  )
}
