#' R Client for Neuroscience Information Framework APIs
#'
#' @name rif-package
#' @aliases rif
#' @docType package
#' @title R Client for Neuroscience Information Framework APIs
#' @author \email{myrmecocystus@@gmail.com}
#' @keywords package
#' @note The following services are not available in this client:
#' \itemize{
#'  \item annotate - It appears that this is mostly for browser based
#'  annotation, so not a good fit for an R package
#' }
#'
#' @section API key:
#' You now need an API key to use the NIF API. Steps:
#' \itemize{
#'  \item Go to <https://www.neuinfo.org/>
#'  \item If you don't have an account yet, register for an account.
#'  \item Log in
#'  \item Go to <https://www.neuinfo.org/account/developer> - you'll need to
#'  enter your password again
#'  \item Create an API key
#'  \item Store your API key ideally as an environment variable in `.Renviron`
#'  or similar. Or, you can save as an R option. (see `?Startup` for help on
#'  env vars and R options). You can also pass in your API key to each function
#'  but that's not ideal.
#' }
NULL
