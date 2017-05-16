context("literature_retractions")

test_that("literature_retractions", {
  tt <- literature_retractions()

  expect_is(tt, "character")
  expect_gt(length(tt), 4000)
})
