context("vocabulary_categories")

test_that("vocabulary_categories", {
  tt <- vocabulary_categories()
  
  expect_is(tt, "list")
})
