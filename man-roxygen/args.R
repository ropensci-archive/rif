#' @param query	Query terms
#' @param expandSynonyms (logical) Should recognized terms in the query have
#' synonyms expanded? Default: \code{TRUE}
#' @param expandAcronyms (logical) Default: \code{FALSE}
#' @param expandAbbrevs (logical) Default: \code{FALSE}
#' @param expandInferred (logical) Should recognized terms in the query have
#' inferred terms expanded? Default: \code{TRUE}
#' @param key (character) API key. required either passed in here or save
#' as an env var or R option. see \code{\link{rif}} and \code{\link{Startup}}
#' @param ... Curl options passed on to \code{\link[crul]{HttpClient}}
