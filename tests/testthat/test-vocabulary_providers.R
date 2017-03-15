context("vocabulary_providers")

test_that("vocabulary_providers", {
  tt <- vocabulary_providers()
  
  expect_is(tt, "list")
})
