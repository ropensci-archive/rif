#' @param query	Query terms
#' @param expandSynonyms (logical) Should recognized terms in the query have synonyms
#' expanded? Default: \code{TRUE}
#' @param expandAcronyms (logical) Default: \code{FALSE}
#' @param expandAbbrevs (logical) Default: \code{FALSE}
#' @param expandInferred (logical) Should recognized terms in the query have inferred terms
#' expanded? Default: \code{TRUE}
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
