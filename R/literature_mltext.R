#' Literature - more like text search
#'
#' @export
#'
#' @param text The query
#' @param offset (integer) The result (row) to start on	query	0
#' @param count (integer) The number of results (rows) to return. Default: 5
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @family literature
#'
#' @examples \dontrun{
#' literature_mltext(text = "cellular")
#' literature_mltext(text = "ecology", count = 200)
#' library("dplyr")
#' literature_mltext(text = "ecology", count = 200) %>%
#'    select(pmid, title)
#' }

literature_mltext <- function(text, offset = 0, count = 20, ...) {
  args <- nc(list(text = text, offset = offset, count = count))
  tbl_df(
    nif_parse(
      nif_GET(file.path(nifbase(), "literature/moreLikeText"), args, accept_json(), ...),
      TRUE)
  )
}
