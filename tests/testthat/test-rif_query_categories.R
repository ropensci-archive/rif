context("rif_query_categories")

test_that("rif_query_categories", {
  tt <- rif_query_categories()
  
  expect_is(tt, "character")
  expect_equal(length(tt), 32)
  expect_match(tt[1], "anatomy")
})
