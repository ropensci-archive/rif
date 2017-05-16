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
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family literature
#'
#' @examples \dontrun{
#' out <- literature_retractions()
#' literature_mlpmid(pmid = out[1:3])
#'
#' literature_mlpmid(pmid = out[1:3])
#' literature_mlpmid(pmid = out[1:3], offset = 2)
#' literature_mlpmid(pmid = out[1:3], count = 3)
#' }

literature_mlpmid <- function(pmid, offset = 0, count = 20, authorFilter = NULL,
                              yearFilter = NULL, journalFilter = NULL,
                              key = NULL, ...) {

  pmids <- args <- stats::setNames(as.list(pmid), rep("pmid", length(pmid)))
  args <- nc(list(offset = offset, count = count,
                  authorFilter = authorFilter, yearFilter = yearFilter,
                  journalFilter = journalFilter, key = key_check(key)))
  args <- c(pmids, args)
  tibble::as_tibble(
    nif_parse(
      nif_GET("literature/moreLikePmid.json", args, ...),
      TRUE)
  )
}
