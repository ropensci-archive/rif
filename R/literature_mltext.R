#' Literature - more like text search
#'
#' @export
#'
#' @param text The query
#' @param offset (integer) The result (row) to start on	query	0
#' @param count (integer) The number of results (rows) to return. Default: 5
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @family literature
#'
#' @examples \dontrun{
#' literature_mltext(text = "cellular")
#' literature_mltext(text = "ecology", count = 200)
#' }

literature_mltext <- function(text, offset = 0, count = 20, key = NULL, ...) {
  args <- nc(list(text = text, offset = offset, count = count,
                  key = key_check(key)))
  tibble::as_tibble(
    nif_parse(
      nif_GET("literature/moreLikeText.json", args, ...),
      TRUE)
  )
}
