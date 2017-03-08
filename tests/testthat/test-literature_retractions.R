context("literature_retractions")

test_that("literature_retractions", {
  tt <- literature_retractions()

  expect_is(tt, "character")
  expect_equal(length(tt), 4653)
  expect_match(tt[1], "21386829")
})
