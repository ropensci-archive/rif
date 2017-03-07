context("vocabulary_suggest")

test_that("vocabulary_suggest", {
  tt <- vocabulary_suggest("cell)
  
  expect.is(tt, "list")
})
