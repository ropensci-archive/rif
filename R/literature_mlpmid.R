#' Literature - more like PMID search
#'
#' @export
#'
#' @param pmid One or more PMID's in a vector or list
#' @param offset (integer) The result (row) to start on	query	0
#' @param count (integer) The number of results (rows) to return. Default: 5
#' @param authorFilter  Author filters
#' @param yearFilter  Year filters
#' @param journalFilter Journal filters
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @family literature
#'
#' @examples \dontrun{
#' out <- literature_retractions()
#' literature_mlpmid(pmid = out[1:3])
#'
#' literature_mlpmid(pmid = out[1:3])
#' literature_mlpmid(pmid = out[1:3], offset = 2)
#' literature_mlpmid(pmid = out[1:3], count = 3)
#' library("dplyr")
#' literature_mlpmid(pmid = out[1:3], yearFilter = 2005) %>%
#'    select(pmid, year)
#' }

literature_mlpmid <- function(pmid, offset = 0, count = 20, authorFilter = NULL,
                              yearFilter = NULL, journalFilter = NULL, ...) {

  pmids <- args <- setNames(as.list(pmid), rep("pmid", length(pmid)))
  args <- nc(list(offset = offset, count = count,
                  authorFilter = authorFilter, yearFilter = yearFilter,
                  journalFilter = journalFilter))
  args <- c(pmids, args)
  tbl_df(
    nif_parse(
      nif_GET(file.path(nifbase(), "literature/moreLikePmid"), args, accept_json(), ...),
      TRUE)
  )
}
